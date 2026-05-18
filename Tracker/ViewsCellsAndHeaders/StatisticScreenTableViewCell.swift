//
//  StatisticScreenTableViewCell.swift
//  Tracker
//
//  Created by Александр Гладков on 18.05.2026.
//

import UIKit

final class StatisticScreenTableViewCell: UITableViewCell {

    static let reuseIdentifier = "StatisticCell"

    private let borderView = GradientBorderView()
    private let cardView = UIView()
    private let counterLabel = UILabel()
    private let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        counterLabel.text = nil
        titleLabel.text = nil
    }

    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.backgroundColor = .clear

        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.borderWidth = 2
        borderView.cornerRadiusValue = 20

        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 18
        cardView.layer.masksToBounds = true

        contentView.addSubview(borderView)
        borderView.addSubview(cardView)

        NSLayoutConstraint.activate([
            borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            borderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            borderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            cardView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 2),
            cardView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -2),
            cardView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 2),
            cardView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -2)
        ])

        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.font = .systemFont(ofSize: 48, weight: .bold)
        counterLabel.textColor = .black

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = .black

        cardView.addSubview(counterLabel)
        cardView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            counterLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            counterLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),

            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])
    }

    func configure(number: Int, title: String) {
        counterLabel.text = String(number)
        titleLabel.text = title
    }
}
