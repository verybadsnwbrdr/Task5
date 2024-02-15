import UIKit

final class PopoverController: UIViewController {
	private lazy var segmentControl = makeSegmentControl()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	private func setup() {
		view.backgroundColor = .white
		
		navigationItem.titleView = segmentControl
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			systemItem: .close,
			primaryAction: UIAction { [self] _ in navigationController?.dismiss(animated: true)}
		)
		
		resizePopover(280)
	}
	
	private func resizePopover(_ height: Int) {
		navigationController?.preferredContentSize = CGSize(width: 300, height: height)
	}
	
	private func makeSegmentControl() -> UISegmentedControl {
		let actions = [
			UIAction(title: "280pt") { [weak self] _ in self?.resizePopover(280) },
			UIAction(title: "150pt") { [weak self] _ in self?.resizePopover(150) }
		]
		let control = UISegmentedControl(frame: .zero, actions: actions)
		control.selectedSegmentIndex = 0
		return control
	}
}
