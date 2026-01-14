//
//  viewmodel.swift
//  Top Learning App
//
//  Created by Hamza Sikandar on 26/08/2025.
// 

import UIKit

class CoursesDataViewModel {
    
    var onDataChanged: (()-> Void)?
    var moveToControllerA: (() ->Void)?
    var moveToControllerB: (() ->Void)?
    var didFiltered: (() -> Void)?
    
    
    private(set) var allSubjectsData: [AllSubjects] = [] {
        didSet {
            onDataChanged?()
        }
    }
    var filterSubjects: [AllSubjects] = [] {
        didSet {
            didFiltered?()
        }
    }
    
    init() {
        loadAllData()
    }
    private func loadAllData() {
        allSubjectsData = [
            AllSubjects(id: 1, categoryName: "Coding", categoryImage: "desktopcomputer", type: "tech", lessons: [
                AllLessons(id: 1, title: "intro", lessonsData: [
                    lessonDetails(id: 1, description: "this is coding intro")
                ]),
                AllLessons(id: 2, title: "lesson 1", lessonsData: [
                    lessonDetails(id: 1, description: "this is lesson 1")
                ]),
                AllLessons(id: 3, title: "lesson 2", lessonsData: [
                    lessonDetails(id: 1, description: "this is lesson 2")
                ])
            ]),
            AllSubjects(id: 2, categoryName: "Art", categoryImage: "paintpalette", type: "non-tech", lessons: [
                AllLessons(id: 1, title: "intro", lessonsData: [
                    lessonDetails(id: 1, description: "this is Art intro")
                ])
            ]),
            AllSubjects(id: 3, categoryName: "Math", categoryImage: "function", type: "tech", lessons: [
                AllLessons(id: 1, title: "intro", lessonsData: [
                    lessonDetails(id: 1, description: "this is Math intro")
                ])
            ]),
            AllSubjects(id: 4, categoryName: "Science", categoryImage: "atom", type: "tech", lessons: [
                AllLessons(id: 1, title: "intro", lessonsData: [
                    lessonDetails(id: 1, description: "this is Math intro")
                ])
            ])
        ]
       filterSubjects = allSubjectsData
    }
    func getLessonsByCategory(category: String) -> [AllLessons] {
        if let subject = allSubjectsData.first(where:  { $0.categoryName == category }) {
            return subject.lessons
        }
        return []
    }
    func getDescriptionByLesson(categoryName: String,lessonTitle: String) -> String {
        let category = allSubjectsData.first(where: { $0.categoryName == categoryName })
        let lessons = category!.lessons.first(where: { $0.title == lessonTitle })
        let details = lessons?.lessonsData.first
        return details!.description
    }
    
    func generateAndCheckRandomNumber() {
        let randomNum = Int.random(in: 0...100)
        print(randomNum)
        if randomNum % 2 == 0 {
            moveToControllerA?()
        } else {
            moveToControllerB?()
        }
    }
    func filterSubjectsByType(type: String) {
        if type == "tech" {
            filterSubjects = allSubjectsData.filter { $0.type == "tech" }
        } else if type == "non-tech" {
            filterSubjects = allSubjectsData.filter { $0.type == "non-tech" }
        } else {
            filterSubjects = allSubjectsData
        }
        didFiltered?()        
    }
}
