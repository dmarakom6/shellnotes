def underlined(text, symbol = '-'):
    print()
    print(text, flush=True)
    print(symbol * len(text), flush=True)

def bordered(text, symbol = '*'):
    print()
    print(symbol * (len(text) + 4), flush=True)
    print(symbol, text, symbol, flush=True)
    print(symbol * (len(text) + 4), flush=True)
    print()