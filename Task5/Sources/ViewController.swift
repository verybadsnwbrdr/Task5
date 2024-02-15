import UIKit

final class ViewController: UIViewController {
	private let button = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		button.frame = CGRect(
			x: view.bounds.midX - 40,
			y: 80,
			width: 80,
			height: 30
		)
	}
	
	private func setup() {
		view.backgroundColor = .white
		view.addSubview(button)
		
		button.setTitle("Present", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.addAction(UIAction { [weak self] _ in self?.action() }, for: .touchUpInside)
	}
	
	private func action() {
		let popoverController = PopoverController()
		let navigationController = UINavigationController(rootViewController: popoverController)
		navigationController.modalPresentationStyle = .popover
		navigationController.popoverPresentationController?.sourceView = button
		navigationController.popoverPresentationController?.sourceRect = CGRect(
			x: button.bounds.midX,
			y: button.bounds.maxY,
			width: .zero,
			height: .zero
		)
		navigationController.popoverPresentationController?.delegate = self
		present(navigationController, animated: true)
	}
}

extension ViewController: UIPopoverPresentationControllerDelegate {
	func adaptivePresentationStyle(
		for controller: UIPresentationController,
		traitCollection: UITraitCollection
	) -> UIModalPresentationStyle {
		.none
	}
	
	func presentationControllerShouldDismiss(
		_ presentationController: UIPresentationController
	) -> Bool {
		false
	}
}
