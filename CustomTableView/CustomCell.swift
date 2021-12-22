//
//  CustomCell.swift
//  CustomTableView
//
//  Created by Ryota Karita on 2021/12/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    private let stackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 10
        return s
    }()
    
    private let indicatorLabel: UILabel = {
        let label = UILabel()
        label.text = "Dec\n12"
        label.textColor = .label
        label.backgroundColor = .red
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(indicatorLabel)
        contentView.addSubview(stackView)
        
        for _ in 0..<5 {
            stackView.addArrangedSubview(ItemView())
        }
        
        indicatorLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, width: 50, height: 50, topPadding: 5, leadingPadding: 5)
        
        stackView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, leading: indicatorLabel.trailingAnchor, trailing: contentView.trailingAnchor,height: 300, topPadding: 5, bottomPadding: 5, leadingPadding: 5, trailingPadding: 5)
        
        let line = UIBezierPath()
        
        line.move(to: CGPoint(x: 55/2, y: indicatorLabel.frame.origin.y + indicatorLabel.frame.height + 5))
        line.addLine(to: CGPoint(x: 55/2, y: contentView.frame.height - 5))
        
        let gridLayer = CAShapeLayer()
        gridLayer.frame = contentView.bounds
        gridLayer.strokeColor = UIColor.red.cgColor
        gridLayer.lineWidth = 2
        
        gridLayer.path = line.cgPath
        contentView.layer.addSublayer(gridLayer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ItemView: UIView {
    
    private let imageView: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "person.fill"))
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tommy Hill"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        layer.cornerRadius = 15
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(nameLabel)
        
        imageView.anchor(top: topAnchor, leading: leadingAnchor, width: 50, height: 50, topPadding: 5, leadingPadding: 5)
        
        titleLabel.anchor(top: topAnchor, leading: imageView.trailingAnchor, trailing: trailingAnchor, height: 20, topPadding: 5, leadingPadding: 5, trailingPadding: 5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil,
                centerX: NSLayoutXAxisAnchor? = nil,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                topPadding: CGFloat = 0,
                bottomPadding: CGFloat = 0,
                leadingPadding: CGFloat = 0,
                trailingPadding: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: leadingPadding).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: -trailingPadding).isActive = true
        }
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
