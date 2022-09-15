//
//  CoreDataManager.swift
//  Semo
//
//  Created by Terry Koo on 2022/09/14.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    let viewContext = CoreDataInitManager.shared.context
    
    private init() {}
    
    // MARK: - 새로운 노래 저장
    func saveNewSong(songTitle: String, songSinger: String) {
        do {
            let fetchRequest = NSFetchRequest<Song>(entityName: "Song")
            fetchRequest.predicate = NSPredicate(format: "title == %@ && singer == %@", songTitle, songSinger)
            let fetchedResults = try viewContext.fetch(fetchRequest)
            // 중복 검사
            guard (fetchedResults.first) != nil  else {
                let newSong: Song = Song(context: self.viewContext)
                newSong.timestamp = Date()
                newSong.id = UUID()
                newSong.title = songTitle
                newSong.singer = songSinger
                try viewContext.save()
                print("title : \(songTitle), singer : \(songSinger) 저장 완료")
                return
            }
            print("[중복 노래] title : \(songTitle), singer : \(songSinger) 저장 불가")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - 새로운 싱잉리스트 생성
    func saveNewSingingList(singingListTitle: String) {
        do {
            let fetchRequest = NSFetchRequest<SingingList>(entityName: "SingingList")
            fetchRequest.predicate = NSPredicate(format: "title == %@", singingListTitle)
            let fetchedResults = try viewContext.fetch(fetchRequest)
            // 중복 검사
            guard (fetchedResults.first?.title) != nil else {
                let newSingingList: SingingList = SingingList(context: self.viewContext)
                newSingingList.timestamp = Date()
                newSingingList.id = UUID()
                newSingingList.title = singingListTitle
                newSingingList.count = 0
                try viewContext.save()
                print("title : \(singingListTitle) 싱잉리스트 생성 완료")
                return
            }
            print("[중복 싱잉리스트] title : \(singingListTitle) 싱잉리스트 생성 불가")
        } catch {
            print(error.localizedDescription)
        }
    }
}
