E = [1, -4, -1, 4, 5, -4, 6, 7, -2]
E = [0, 0, 0, 4, 3, 3, 8, -1, 6, 8]

def main():
    print(max_events(8, 10))

def max_events(p, t):
    viewable = 0
    if abs(p) > t:
        return -100e10
    if t == 0:
        if p == 0:
            return 0
        else:
            return -100e10
    if p == E[t-1]:
        viewable = 1
    increase = max_events(p + 1, t - 1)
    stay = max_events(p, t - 1)
    decrease = max_events(p - 1, t - 1)
    return max(increase, stay, decrease) + viewable





if __name__ == "__main__":
    main()