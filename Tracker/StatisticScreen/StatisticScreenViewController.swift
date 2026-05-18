//
//  StatisticScreenViewController.swift
//  Tracker
//

import Foundation
import UIKit

final class StatisticScreenViewController: UIViewController {

    var trackerCount: Int {
        TrackerRecordStore.shared.loadRecords().count
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = NSLocalizedString("statistics", comment: "Statistic")
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let stubImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "StubStatistic"))
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let stubLabel: UILabel = {
        let label = UILabel()
        
        label.text = NSLocalizedString("statisric_screen_stub", comment: "Statistic")
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(StatisticScreenTableViewCell.self, forCellReuseIdentifier: StatisticScreenTableViewCell.reuseIdentifier)
        tableView.rowHeight = 136

        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupViews()
        updateEmptyState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
        updateEmptyState()
    }
    
    private func setupViews() {
        
        view.addSubview(titleLabel)
        view.addSubview(stubImageView)
        view.addSubview(stubLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 105),
            
            stubImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stubImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 246),
            stubImageView.heightAnchor.constraint(equalToConstant: 80),
            stubImageView.widthAnchor.constraint(equalToConstant: 80),
            
            stubLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stubLabel.topAnchor.constraint(equalTo: stubImageView.bottomAnchor, constant: 8),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 77),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateEmptyState() {
        let isEmpty = trackerCount == 0
        
        stubImageView.isHidden = !isEmpty
        stubLabel.isHidden = !isEmpty
        tableView.isHidden = isEmpty
    }
}

extension StatisticScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatisticScreenTableViewCell.reuseIdentifier, for: indexPath) as? StatisticScreenTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(number: trackerCount, title: NSLocalizedString("the_best_period", comment: "The best period."))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
