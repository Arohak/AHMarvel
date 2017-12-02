
import UIKit
import Reusable
import PureLayout

extension CharacterTableCell: Reusable { }

class CharacterTableCell: UITableViewCell {
    
    lazy var cellContentView: CharacterCellContentView = {
        let view = CharacterCellContentView.newAutoLayout()

        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharacterTableCell: ViewConfiguration {
    
    func configureViews() {
        selectionStyle = .none
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(cellContentView)
    }
    
    func setupConstraints() {
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
}

extension CharacterTableCell {
    
    func setup(with item: Character) {
        cellContentView.setup(with: item)
    }
}
