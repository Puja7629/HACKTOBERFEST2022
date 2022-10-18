import random

hang = ["""
H A N G M A N - Fruit Edition

   +---+
   |   |
       |
       |
       |
       |
=========""", """
H A N G M A N - Fruits Edition

  +---+
  |   |
  O   |
      |
      |
      |
=========""", """
H A N G M A N - Fruits Edition

  +---+
  |   |
  O   |
  |   |
      |
      |
=========""", """
H A N G M A N - Fruits Edition

  +---+
  |   |
  O   |
 /|   |
      |
      |
=========""", """
H A N G M A N - Fruits Edition

  +---+
  |   |
  O   |
 /|\  |
      |
      |
=========""", """
H A N G M A N - Fruits Edition

  +---+
  |   |
  O   |
 /|\  |
 /    |
      |
=========""", """
H A N G M A N - Fruits Edition

  +---+
  |   |
  O   |
 /|\  |
 / \  |
      |
========="""]


def getRandomWord():
    words = ['apple', 'banana', 'mango', 'strawberry', 'orange', 'grape', 'pineapple', 'apricot',
             'lemon', 'coconut', 'watermelon', 'cherry', 'papaya', 'berry', 'peach', 'lychee', 'muskmelon']

    word = random.choice(words)
    return word


def displayBoard(hang, missedLet, correctLet, secretWord):
    print(hang[len(missedLet)])
    print()

    print('Missed Letters:', end=' ')
    for letter in missedLet:
        print(letter, end=' ')
    print("\n")

    blanks = '_' * len(secretWord)

    for i in range(len(secretWord)):  
        if secretWord[i] in correctLet:
            blanks = blanks[:i] + secretWord[i] + blanks[i+1:]

    for letter in blanks: 
        print(letter, end=' ')
    print("\n")


def getGuess(alreadyGuessed):
    while True:
        guess = input('Guess a letter: ')
        guess = guess.lower()
        if len(guess) != 1:
            print('Please enter a single letter.')
        elif guess in alreadyGuessed:
            print('You have already guessed that letter. Choose again.')
        elif guess not in 'abcdefghijklmnopqrstuvwxyz':
            print('Please enter a LETTER.')
        else:
            return guess


def playAgain():
    return input("\nDo you want to play again? ").lower().startswith('y')


missedLet = ''
correctLet = ''
secretWord = getRandomWord()
gameIsDone = False

while True:
    displayBoard(hang, missedLet, correctLet, secretWord)

    guess = getGuess(missedLet + correctLet)

    if guess in secretWord:
        correctLet = correctLet + guess

        foundAllLetters = True
        for i in range(len(secretWord)):
            if secretWord[i] not in correctLet:
                foundAllLetters = False
                break
        if foundAllLetters:
            print('\nYes! The secret word is "' +
                  secretWord + '"! You have won!')
            gameIsDone = True
    else:
        missedLet = missedLet + guess

        if len(missedLet) == len(hang) - 1:
            displayBoard(hang, missedLet,
                         correctLet, secretWord)
            print('You have run out of guesses!\nAfter ' + str(len(missedLet)) + ' missed guesses and ' +
                  str(len(correctLet)) + ' correct guesses, the word was "' + secretWord + '"')
            gameIsDone = True

    if gameIsDone:
        if playAgain():
            missedLet = ''
            correctLet = ''
            gameIsDone = False
            secretWord = getRandomWord()
        else:
            break

