# StringMetric.swift
[![Build Status](https://travis-ci.org/autozimu/StringMetric.swift.svg?branch=master)](https://travis-ci.org/autozimu/StringMetric.swift)

[String metric](https://en.wikipedia.org/wiki/String_metric) functions implemented in Swift.

Currently, following functions are implemented,
- `distance`: alias of `distanceLevenshtein`
- `distanceLevenshtein`: [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
- `distanceDamerauLevenshtein`: [Damerau-Levenshtein distance](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance)
- `distanceHamming`: [Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance)
- `distanceMostFreqK`: [Most frequent k characters](https://en.wikipedia.org/wiki/Most_frequent_k_characters)
- `distanceJaroWinkler`: [Jaro-Winkler distance](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance)

## Usage

For [Swift Package Manager](https://github.com/apple/swift-package-manager)
users, add this module as dependency in `Package.swift`,

```swift
.Package(url: "https://github.com/autozimu/StringMetric.swift.git", majorVersion: 0)
```

## Example

```swift
"kitten".distance(between: "sitting")    // => 3
"君子和而不同".distance(between: "小人同而不和")    // => 4
```

## Documentation
<https://autozimu.github.io/StringMetric.swift/>
