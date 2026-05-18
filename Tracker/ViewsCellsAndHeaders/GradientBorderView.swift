//
//  GradientBorderView.swift
//  Tracker
//
import UIKit

final class GradientBorderView: UIView {

    private let gradientLayer = CAGradientLayer()
    private let shapeLayer = CAShapeLayer()

    var borderWidth: CGFloat = 2 {
        didSet { setNeedsLayout() }
    }

    var cornerRadiusValue: CGFloat = 20 {
        didSet { setNeedsLayout() }
    }

    var colors: [UIColor] = [.systemRed, .systemGreen, .systemBlue] {
        didSet { setNeedsLayout() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .clear

        gradientLayer.colors = colors.map(\.cgColor)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(gradientLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        gradientLayer.frame = bounds

        let inset = borderWidth / 2
        let rect = bounds.insetBy(dx: inset, dy: inset)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadiusValue)

        shapeLayer.frame = bounds
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = borderWidth

        gradientLayer.mask = shapeLayer
    }
}
