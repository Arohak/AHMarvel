
import UIKit
import Reusable
import PureLayout

class CustomCell: UITableViewCell, Reusable {
    
    //MARK: - Create UIElements -
    var cellContentView = CustomCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func height() -> CGFloat {
        return 80
    }
    
    func setup(item: Character) {
        cellContentView.titleLabel.text         = item.name
        cellContentView.descriptionLabel.text   = item.bio.isEmpty ? "No description" : item.bio
        cellContentView.thumbImageView.download(image: item.thumImage?.fullPath() ?? "")
    }
}

//MARK: - CustomCellContentView
class CustomCellContentView: UIView {
    
    //MARK: - Initialize -
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addAllUIElements()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods -
    private func addAllUIElements() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(thumbImageView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        let inset: CGFloat = 10
        let width: CGFloat = 70

        thumbImageView.autoAlignAxis(toSuperviewAxis: .horizontal)
        thumbImageView.autoPinEdge(toSuperviewEdge: .left, withInset: inset)
        thumbImageView.autoSetDimensions(to: CGSize(width: width, height: width))

        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: inset)
        titleLabel.autoPinEdge(.left, to: .right, of: thumbImageView, withOffset: inset)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: inset)

        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel)
        descriptionLabel.autoPinEdge(.left, to: .right, of: thumbImageView, withOffset: inset)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .right, withInset: inset)
    }
    
    //MARK: - Create UIElements -
    lazy var thumbImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel.newAutoLayout()
        view.textAlignment = .center
        view.textColor = UIColor.blue
        view.textAlignment = .left

        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel.newAutoLayout()
        view.textAlignment = .center
        view.textColor = UIColor.red
        view.textAlignment = .left
        view.numberOfLines = 2
        
        return view
    }()
}
