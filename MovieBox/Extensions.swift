//
//  Extensions.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-28.
//

import Foundation

extension Encodable {
    func createDictionary() -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let data = try? encoder.encode(self) else { return [:] }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
