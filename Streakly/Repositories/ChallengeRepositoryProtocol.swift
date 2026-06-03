//
//  ChallengeRepositoryProtocol.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 8.05.26.
//

import Foundation

protocol ChallengeRepositoryProtocol: AnyObject {
    func fetchAll() throws -> [Challenge]
    func add(_ challenge: Challenge) throws
    func delete(_ challenge: Challenge) throws
    func save() throws
}
