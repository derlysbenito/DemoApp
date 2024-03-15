//
//  MainPresenterProtocol.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

public protocol MainPresenterProtocol{
    func setupPresenter()
    func setViewControllers(viewControllers: [UIViewController], animated: Bool)
    func presentViewController(viewController: UIViewController, animate: Bool)
    func pushViewController(viewController: UIViewController, animate: Bool)
    func popViewController(animate: Bool)
    func dismiss(animate: Bool)
}
