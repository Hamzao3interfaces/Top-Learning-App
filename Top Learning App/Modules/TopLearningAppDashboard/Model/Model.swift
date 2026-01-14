//
//  Model.swift
//  Top Learning App
//
//  Created by Hamza Sikandar on 26/08/2025.
//

struct AllSubjects {
    let id: Int
    let categoryName: String
    let categoryImage: String
    let type: String
    let lessons: [AllLessons]
}
struct AllLessons {
    let id: Int
    let title: String
    let lessonsData: [lessonDetails]
}
struct lessonDetails {
    let id: Int
    let description: String
}
