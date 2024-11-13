import Foundation
import Poker

@main
actor CPU: Player {
    var myPlayerID: Int = -1
    var myCards: [Card] = []
    var sharedCards: [Card] = []
    var money = 25 * 100 // $25 in cents
    var pot = 0

    func cardsWereRevealed(event: CardReveal) {
        self.sharedCards.append(contentsOf: event.cards)
    }

    func turnDidOccur(event: Turn) {
        self.pot = event.potValue
    }

    func doTurn(event: TurnRequest) -> Action {
        return .fold
    }

    func beginRound(event: RoundStart) async {
        self.myPlayerID = event.playerID
        self.myCards = event.cards
        self.sharedCards = []
        self.money -= event.ante
        self.pot = event.numberOfPlayers * event.ante
    }
}
