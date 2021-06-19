import Foundation
import RxSwift

public extension Solana {
    func getTokenLargestAccounts(pubkey: String, commitment: Commitment? = nil) -> Single<[TokenAmount]> {
        Single.create { emitter in
            self.getTokenLargestAccounts(pubkey: pubkey, commitment: commitment) {
                switch $0 {
                case .success(let accounts):
                    emitter(.success(accounts))
                case .failure(let error):
                    emitter(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
}
