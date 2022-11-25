//
//  FetchBookListResponseDto.swift
//  IN_SOPT_Welaaa
//
//  Created by 최가연 on 2022/11/21.
//


// MARK: - FetchBookListResponseDto
struct FetchBookListResponseDto: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: BookListDto
}

// MARK: - DataClass
struct BookListDto: Codable {
    let bookList: [BookDto]
}

// MARK: - BookList
struct BookDto: Codable {
    let id: Int
    let title, bookListDescription, image, author: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case bookListDescription = "description"
        case image, author
    }
    
    static func sampleData() -> [BookDto] {
        return [BookDto(id: 0, title: "거짓말", bookListDescription: "ㅇㄴㄹㄴㅇㄹ", image: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/welaaa/book/bookCover.jpg", author: "김나은"),
                BookDto(id: 0, title: "거짓말", bookListDescription: "ㅇㄴㄹㄴㅇㄹ", image: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/welaaa/book/bookCover.jpg", author: "김나은"),
                BookDto(id: 0, title: "거짓말", bookListDescription: "ㅇㄴㄹㄴㅇㄹ", image: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/welaaa/book/bookCover.jpg", author: "김나은"),
                BookDto(id: 0, title: "거짓말", bookListDescription: "ㅇㄴㄹㄴㅇㄹ", image: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/welaaa/book/bookCover.jpg", author: "김나은"),
                BookDto(id: 0, title: "거짓말", bookListDescription: "ㅇㄴㄹㄴㅇㄹ", image: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/welaaa/book/bookCover.jpg", author: "김나은"),
                BookDto(id: 0, title: "거짓말", bookListDescription: "ㅇㄴㄹㄴㅇㄹ", image: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/welaaa/book/bookCover.jpg", author: "김나은"),
                BookDto(id: 0, title: "거짓말", bookListDescription: "ㅇㄴㄹㄴㅇㄹ", image: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/welaaa/book/bookCover.jpg", author: "김나은"),
                BookDto(id: 0, title: "거짓말", bookListDescription: "ㅇㄴㄹㄴㅇㄹ", image: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/welaaa/book/bookCover.jpg", author: "김나은")]
    }
}
