def lengthOfLongestSubstring(input_string):
    chars = [0] * 128

    i = j = 0  # start & end characters
    n = len(input_string)

    result = 0
    while j < n:
        r = input_string[j]
        chars[ord(r)] += 1

        while chars[ord(r)] > 1:
            l = input_string[i]
            chars[ord(l)] -= 1
            i += 1

        result = max(result, j - i + 1)
        j += 1
    return result


string = "servicessolutionssuccess"
print(lengthOfLongestSubstring(string))
