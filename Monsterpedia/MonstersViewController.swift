//
//  ViewController.swift
//  Monsterpedia
//
//  Created by Emmanuoel Haroutunian on 7/30/16.
//  Copyright © 2016 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit
import CoreData

class MonstersViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var coreDataStack: CoreDataStack!
	var fetchRequest: NSFetchRequest<Monster>!
	var monsters = [Monster]()
	var filteredMonsters = [Monster]()
	let searchController = UISearchController(searchResultsController: nil)
	
	// Vars only utilized when modifying team members
	var isTeamBuilding = false
	var selectedMonster: Monster!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fetchRequest = NSFetchRequest(entityName: "Monster")
		let sortDesc = NSSortDescriptor(key: "id", ascending: true)
		fetchRequest.sortDescriptors = [sortDesc]
		do {
			monsters = try coreDataStack.context.fetch(fetchRequest)
		} catch let error as NSError {
			print(error)
		}
		
		setupSearchController()
		setupTableView()

		
		
//		The following code is added because Xcode falsely thinks there is a bug when exiting MonstersVC while editing team members
//		searchController.loadViewIfNeeded()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showMonsterDetail" {
			print("Selected Monster in ShowMonsterDetail: \(selectedMonster)")
			let destinationVC = segue.destination as! MonsterDetailViewController
			destinationVC.selectedMonster = selectedMonster
		}
		// TODO: Determine if needed depending on whether bug with unwind segue is fixed
		else if segue.identifier == "saveToTeamBuilderTableVC" {
			
		}
	}
}

// MARK: SearchResultsController Functions
extension MonstersViewController: UISearchBarDelegate, UISearchResultsUpdating {
	func filterContentForSearchText(_ searchText: String, scope: String = "All") {
		if searchController.searchBar.text != "" {
			filteredMonsters = monsters.filter{ (monster) -> Bool in
				return monster.name.lowercased().contains(searchText.lowercased())
			}
		} else {
			filteredMonsters = monsters
		}
		tableView.reloadData()
	}
	
	func updateSearchResults(for searchController: UISearchController) {
		filterContentForSearchText(searchController.searchBar.text!)
	}
	
	func setupSearchController() {
		searchController.searchResultsUpdater = self
		searchController.hidesNavigationBarDuringPresentation = false
		searchController.dimsBackgroundDuringPresentation = false
		definesPresentationContext = true
		
		let searchBar = searchController.searchBar
		searchBar.searchBarStyle = .minimal
		searchBar.backgroundColor = UIColor.white
		searchBar.tintColor = UIColor(red: 240/255, green: 11/255, blue: 49/255, alpha: 1)
		searchBar.delegate = self
		UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = UIColor(red: 240/255, green: 11/255, blue: 49/255, alpha: 1)
		filteredMonsters = monsters
		
		tableView.tableHeaderView = searchBar
	}
}

// MARK: Table View Functions
extension MonstersViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredMonsters.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "MonsterSpriteCell", for: indexPath) as! MonsterSpriteCell
		let monster = filteredMonsters[indexPath.row]
		
		cell.nameLabel.text = monster.name
		cell.descriptionLabel.text = "\(monster.genus) Pokémon"
		cell.spriteImageView.image = UIImage(named: monster.spriteImageName)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let cell = tableView.cellForRow(at: indexPath) as! MonsterSpriteCell
		selectedMonster = filteredMonsters[indexPath.row]
		if isTeamBuilding {
			cell.tintColor = UIColor(red: 240/255, green: 11/255, blue: 49/255, alpha: 1)
			cell.accessoryType = cell.accessoryType == .checkmark ? .none : .checkmark
			if searchController.isActive {
				searchController.dismiss(animated: true) {
					self.performSegue(withIdentifier: "saveToTeamBuilderTableVC", sender: cell)
				}
			} else {
				performSegue(withIdentifier: "saveToTeamBuilderTableVC", sender: cell)
			}
		} else if !isTeamBuilding {
			performSegue(withIdentifier: "showMonsterDetail", sender: self)
		}
	}
	
	func setupTableView() {
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 88
		
		if !isTeamBuilding {
			let searchBarHeight = searchController.searchBar.bounds.height
			tableView.contentOffset = CGPoint(x: 0, y: searchBarHeight)
		}
	}
}
