//
//  OrderFormViewModel.swift
//  Graffity
//
//  Created by Karen Khachatryan on 26.11.24.
//

import Foundation
import UIKit

class OrderFormViewModel {
    static let shared = OrderFormViewModel()
    @Published var orderModel = OrderModel(id: UUID(), photos: [UIImage.imagePlaceholder.pngData() ?? Data()])

    private init() {}
    
    func create(completion: @escaping (Error?) -> Void) {
        CoreDataManager.shared.saveOrder(orderModel: orderModel, completion: completion)
    }
    
    func addImage(data: Data) {
        if orderModel.photos.first == UIImage.imagePlaceholder.pngData() {
            orderModel.photos.removeAll()
        }
        orderModel.photos.append(data)
    }
    
    func clear() {
        orderModel = OrderModel(id: UUID(), photos: [UIImage.imagePlaceholder.pngData() ?? Data()])
    }
}
