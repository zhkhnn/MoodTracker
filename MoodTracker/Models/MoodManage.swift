//
//  MoodManage.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 26.11.2022.
//

import Foundation

protocol MoodManagerDelegate{
    func didUpdateMood(_ moodManager: MoodManage, with model: MoodModel)
    
    func didFailWithError(error: Error)
}

struct MoodManage{
    private func setMoodname(){
//        let decodedData = try decoder.decode(MoodData.self, from: data)
        
    }
}
