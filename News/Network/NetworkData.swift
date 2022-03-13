import Foundation
struct NetworkData: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
struct DetailsData: Decodable {
    let username: String
    let name: String
    let email: String
    let website: String
    let company: String
    let id: String
}
struct Company: Decodable {
    let name: String
}
struct CommentsData: Decodable {
    let body: String
}

struct UsersData: Decodable {
    let name: String
    let username: String
}
