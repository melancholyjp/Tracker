//
//  TrackerCollectionViewCell.swift
//  Tracker
//

import UIKit

final class TrackerCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "TrackerCollectionViewCell"

    private let containerView = UIView()
    private let topView = UIView()
    private let bottomView = UIView()

    private let emojiLabel = UILabel()
    private let titleLabel = UILabel()
    private let daysLabel = UILabel()
    private let addButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        emojiLabel.text = nil
        titleLabel.text = nil
        daysLabel.text = "0 дней"
    }

    func configure(emoji: String, title: String, days: String = "0 дней") {
        emojiLabel.text = emoji
        titleLabel.text = title
        daysLabel.text = days
    }

    private func setupViews() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 22
        containerView.layer.masksToBounds = true

        topView.backgroundColor = UIColor.systemGreen
        bottomView.backgroundColor = .white

        emojiLabel.font = .systemFont(ofSize: 28)
        emojiLabel.textAlignment = .center

        titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2

        daysLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        daysLabel.textColor = .black

        addButton.backgroundColor = UIColor.systemGreen
        addButton.layer.cornerRadius = 26
        addButton.clipsToBounds = true
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 32, weight: .light)

        contentView.addSubview(containerView)
        containerView.addSubview(topView)
        containerView.addSubview(bottomView)

        topView.addSubview(emojiLabel)
        topView.addSubview(titleLabel)

        bottomView.addSubview(daysLabel)
        bottomView.addSubview(addButton)
    }

    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            topView.topAnchor.constraint(equalTo: containerView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.72),

            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            emojiLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12),
            emojiLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 12),
            emojiLabel.widthAnchor.constraint(equalToConstant: 36),
            emojiLabel.heightAnchor.constraint(equalToConstant: 36),

            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -18),

            daysLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            daysLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),

            addButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            addButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 52),
            addButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}
