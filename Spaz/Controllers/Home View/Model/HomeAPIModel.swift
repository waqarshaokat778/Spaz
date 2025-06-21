//
//  HomeAPIModel.swift
//  Spaz
//
//  Created by Wahyd Pvt Ltd on 17/08/2022.
//

import Foundation

struct HomeAPIModel : Codable {
    let status : String?
    let message : String?
    let validationErrors : ValidationErrors?
    let data : homeData?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case validationErrors = "validationErrors"
        case data = "oData"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        validationErrors = try values.decodeIfPresent(ValidationErrors.self, forKey: .validationErrors)
        data = try values.decodeIfPresent(homeData.self, forKey: .data)
    }
}

struct homeData : Codable {
    let email : String?
    let address : String?
    let phone : String?
    let facebook : String?
    let twitter : String?
    let instagram : String?
    let youtube : String?
    let linkedin : String?
    let total_products : String?
    let total_quantity : String?
    let user_invite_code : String?
    let user_invite_url : String?
    let user_invite_message : String?
    let slider : [Slider]?
    let service_categories : [Service_categories]?

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case address = "address"
        case phone = "phone"
        case facebook = "facebook"
        case twitter = "twitter"
        case instagram = "instagram"
        case youtube = "youtube"
        case linkedin = "linkedin"
        case total_products = "total_products"
        case total_quantity = "total_quantity"
        case user_invite_code = "user_invite_code"
        case user_invite_url = "user_invite_url"
        case user_invite_message = "user_invite_message"
        case slider = "slider"
        case service_categories = "service_categories"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        facebook = try values.decodeIfPresent(String.self, forKey: .facebook)
        twitter = try values.decodeIfPresent(String.self, forKey: .twitter)
        instagram = try values.decodeIfPresent(String.self, forKey: .instagram)
        youtube = try values.decodeIfPresent(String.self, forKey: .youtube)
        linkedin = try values.decodeIfPresent(String.self, forKey: .linkedin)
        total_products = try values.decodeIfPresent(String.self, forKey: .total_products)
        total_quantity = try values.decodeIfPresent(String.self, forKey: .total_quantity)
        user_invite_code = try values.decodeIfPresent(String.self, forKey: .user_invite_code)
        user_invite_url = try values.decodeIfPresent(String.self, forKey: .user_invite_url)
        user_invite_message = try values.decodeIfPresent(String.self, forKey: .user_invite_message)
        slider = try values.decodeIfPresent([Slider].self, forKey: .slider)
        service_categories = try values.decodeIfPresent([Service_categories].self, forKey: .service_categories)
    }

}

struct Service_categories : Codable {
    let category_image : String?
    let category_id : String?
    let category_name : String?
    let category_uid : String?

    enum CodingKeys: String, CodingKey {
        case category_image = "category_image"
        case category_id = "category_id"
        case category_name = "category_name"
        case category_uid = "category_uid"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        category_uid = try values.decodeIfPresent(String.self, forKey: .category_uid)
    }
}

struct Slider : Codable {
    let name : String?
    let image : String?
    let target : String?
    let target_data : Target_data?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case image = "image"
        case target = "target"
        case target_data = "target_data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        target = try values.decodeIfPresent(String.self, forKey: .target)
        target_data = try values.decodeIfPresent(Target_data.self, forKey: .target_data)
    }
}

struct Target_data : Codable {
    let category_id : String?
    let category_name : String?
    let category_uid : String?
    let category_image : String?

    enum CodingKeys: String, CodingKey {
        case category_id = "category_id"
        case category_name = "category_name"
        case category_uid = "category_uid"
        case category_image = "category_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        category_uid = try values.decodeIfPresent(String.self, forKey: .category_uid)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
    }
}
