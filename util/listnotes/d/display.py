def underlined(text, symbol = '-'):
    print()
    print(text)
    print(symbol * len(text))

def bordered(text, symbol = '*'):
    print()
    print(symbol * (len(text) + 4))
    print(symbol, text, symbol)
    print(symbol * (len(text) + 4))
    print()