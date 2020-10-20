
{}
  :apis $ []
    {}
      :name |defn
      :tags $ #{} :syntax
      :desc "|create functions on namespaces"
      :snippets $ []
        quote $ defn (a b) $ + a b
        quote $ defn (a $ xs) echo a xs
    {}
      :name |fn
      :tags $ #{} :syntax
      :desc "|create anounymous functions"
      :snippets $ []
        quote $ defn (a b) $ + a b
        quote $ defn (a $ xs) echo a xs
    {}
      :name |quote
      :tags $ #{} :syntax
      :desc "|return quoted data, mainly lists that are not evaludated"
      :snippets $ []
        quote $ quote $ [] + 1 2 3
    {}
      :name |quote-replace
      :tags $ #{} :syntax
      :desc "|used in defmacro, togather with `~` for replacing in quoted data"
      :snippets $ []
        quote $ quote-replace $ + 1 2 3 (~ a)
    {}
      :name |&
      :tags $ #{} :syntax
      :desc "|argument spread operator, used in function creating or calling"
      :snippets $ []
        {}
          :desc "|use `&` to collect arguments into a list named `xs`"
          :code $ quote $ defn f (x0 & xs) $ echo xs
        {}
          :desc "|use `&` to flatten `xs` into multiple arguments"
          :code $ quote $ f x0 & xs
    {}
      :name |~
      :tags $ #{} :syntax
      :desc "|replaces variables in quoted data"
      :snippets $ []
        quote $ quote-replace $ + 1 2 (~ a)
    {}
      :name |~@
      :tags $ #{} :syntax
      :desc "|like `~` but turns a list into multiple symbols beforing inserting"
      :snippets $ []
        quote $ quote-replace $ + 1 2 (~@ xs)
    {}
      :name |do
      :tags $ #{} :syntax
      :desc "|add multiple numbers"
      :snippets $ []
        quote $ do
          echo 1
          echo 2
    {}
      :name |defmacro
      :tags $ #{} :syntax
      :desc "|defines macros"
      :snippets $ []
        quote $ defmacro m1 (a b)
          quote-replace $ + (~ a) (~ b)
    {}
      :name |[]
      :tags $ #{} :syntax
      :desc "|operator for creating lists, internally it's ternary tree list"
      :snippets $ []
        quote $ [] 1 2 3 4 (+ 1 2)
    {}
      :name |{}
      :tags $ #{} :syntax
      :desc "|operator for creating maps, internally it's ternary tree map"
      :snippets $ []
        quote $ {} (:a 1) (:b $ + 2 3)
    {}
      :name |if
      :tags $ #{} :syntax
      :desc "|if syntax, when ELSE branch is omitted, it will be `nil`"
      :snippets $ []
        quote $ if (> a 1) |true |false
        quote $ if (> a 1) |just-true
    {}
      :name |;
      :tags $ #{} :syntax
      :desc "|adds comments"
      :snippets $ []
        quote $ ; "this will not be evaludated" "more comments"
    {}
      :name |let
      :tags $ #{} :syntax
      :desc "|local variable bindings"
      :snippets $ []
        quote $ let
            a 1
            b $ + a 1
          + a b
    {}
      :name |loop
      :tags $ #{} :syntax
      :desc "|like Clojure `loop`, use tail recursion to loop inside expressions"
      :snippets $ []
        quote $ loop
            idx 0
            acc $ []
          if (< idx 10)
            recur (+ idx 1) (append acc idx)
            , acc
        quote $ loop () (echo "|never ends") (recur)
    {}
      :name |assert
      :tags $ #{} :syntax
      :desc "|like Clojure `assert`, but string is placed first"
      :snippets $ []
        quote $ assert "|x > 0" (> x 0)
    {}
      :name |&+
      :tags $ #{} :native
      :desc "|native add function which adds 2 numbers"
      :snippets $ []
        quote $ &+ 1 2
    {}
      :name |&-
      :tags $ #{} :native
      :desc "|native add function which substracts one number from another"
      :snippets $ []
        quote $ &+ 2 1
    {}
      :name |&*
      :tags $ #{} :native
      :desc "|native add function which multiples 2 numbers"
      :snippets $ []
        quote $ &* 2 3
    {}
      :name |&/
      :tags $ #{} :native
      :desc "|native add function which divide one number by another"
      :snippets $ []
        quote $ &+ 10 2
    {}
      :name |mod
      :tags $ #{} :native
      :desc "|function for get a reminder value"
      :snippets $ []
        quote $ = 2 $ mod 5 3
    {}
      :name |&<
      :tags $ #{} :native
      :desc "|native `<` function for 2 numbers"
      :snippets $ []
        quote $ &< 2 3
    {}
      :name |&>
      :tags $ #{} :native
      :desc "|native `>` function for 2 numbers"
      :snippets $ []
        quote $ &> 3 2
    {}
      :name |&=
      :tags $ #{} :native
      :desc "|native `=` function for 2 numbers"
      :snippets $ []
        quote $ &= 2 (+ 1 1)
    {}
      :name |&and
      :tags $ #{} :native
      :desc "|native `and` function for 2 booleans"
      :snippets $ []
        quote $ &and true true
    {}
      :name |&or
      :tags $ #{} :native
      :desc "|native `or` function for 2 booleans"
      :snippets $ []
        quote $ &or false true
    {}
      :name |not
      :tags $ #{} :native
      :desc "|just `not`"
      :snippets $ []
        quote $ not true
    {}
      :name |count
      :tags $ #{} :native
      :desc "|just `count`"
      :snippets $ []
        quote $ count $ []
        quote $ count $ {}
    {}
      :name |get
      :tags $ #{} :native
      :desc "|like Clojure `get`"
      :snippets $ []
        quote $ get ([] 1 2 3) 1
        quote $ get
          {}
            :a 1
            :b 2
          , :a
    {}
      :name |rest
      :tags $ #{} :native
      :desc "|slice list without first item, return empty list if `nil`"
      :snippets $ []
        quote $ rest $ [] 1 2 3 4
    {}
      :name |raise-at
      :tags $ #{} :native
      :desc "|raise exception at give symbol or expression. still putting string first"
      :snippets $ []
        quote $ raise-at "|xs has error" xs
    {}
      :name |type-of
      :tags $ #{} :native
      :desc "|gets type of a value, returns in a keyword"
      :snippets $ []
        quote $ type-of a
    {}
      :name |read-file
      :tags $ #{} :native
      :desc "|read string from a relative file path"
      :snippets $ []
        quote $ read-file |demo.md
    {}
      :name |write-file
      :tags $ #{} :native
      :desc "|write string content to a relative file path"
      :snippets $ []
        quote $ write-file |demo.md "|some content"
    {}
      :name |load-json
      :tags $ #{} :native
      :desc "|loads JSON string into data"
      :snippets $ []
        quote $ load-json |demo.json
    {}
      :name |macroexpand
      :tags $ #{} :native
      :desc "|expand quoted data for debugging purpose, notice that quote is required"
      :snippets $ []
        quote $ macroexpand $ quote $ when true 1 2 3
    {}
      :name |println
      :tags $ #{} :native
      :desc "|displays values"
      :snippets $ []
        quote $ println 1 2 3
    {}
      :name |echo
      :tags $ #{} :native
      :desc "|displays values, alias for println"
      :snippets $ []
        quote $ echo 1 2 3
    {}
      :name |pr-str
      :wip? true
      :tags $ #{} :native
      :desc "|displays values with more details, string being escaped"
      :snippets $ []
        quote $ pr-str 1 2 3
    {}
      :name |prepend
      :tags $ #{} :native :list
      :desc "|returns new list, with new item at first"
      :snippets $ []
        quote $ prepend ([] 1 2 3) 0
    {}
      :name |append
      :tags $ #{} :native :list
      :desc "|returns new list, with new item at tail"
      :snippets $ []
        quote $ append ([] 1 2 3) 4
    {}
      :name |first
      :tags $ #{} :native
      :desc "|return first item of list"
      :snippets $ []
        quote $ first $ [] 1 2 3 4
    {}
      :name |empty?
      :tags $ #{} :native
      :desc "|detects empty list or map, returns `true` for `nil`"
      :snippets $ []
        quote $ empty? nil
        quote $ empty? $ []
        quote $ empty? $ {}
    {}
      :name |last
      :tags $ #{} :native
      :desc "|return last item of list"
      :snippets $ []
        quote $ last $ [] 1 2 3 4
    {}
      :name |butlast
      :tags $ #{} :native
      :desc "|slice list without last item, return empty list if `nil`"
      :snippets $ []
        quote $ butlast $ [] 1 2 3 4
    {}
      :name |reverse
      :tags $ #{} :native
      :desc "|return a list with order reversed"
      :snippets $ []
        quote $ reverse $ [] 1 2 3 4
    {}
      :name |turn-string
      :tags $ #{} :native
      :desc "|turn something into a string"
      :snippets $ []
        quote $ turn-symbol :key
        quote $ turn-symbol 'key
        quote $ turn-symbol 1
    {}
      :name |turn-symbol
      :tags $ #{} :native
      :desc "|turn something into a symbol"
      :snippets $ []
        quote $ turn-symbol |a
        quote $ turn-symbol :a
    {}
      :name |turn-keyword
      :tags $ #{} :native
      :desc "|turn something into a keyword"
      :snippets $ []
        quote $ turn-keyword |k
        quote $ turn-keyword 'k
    {}
      :name |identical
      :wip? true
      :tags $ #{} :native
      :desc "|detects if items share the same pointer, mainly for lists and maps"
      :snippets $ []
        quote $ identical? a b
    {}
      :name |range
      :tags $ #{} :native
      :desc "|return a list of ranged numbers"
      :snippets $ []
        quote $ range 10
        quote $ range 1 10
        quote $ range 1 10 2
    {}
      :name |slice
      :tags $ #{} :native
      :desc "|return a slice of list, item at last index is not included"
      :snippets $ []
        quote $ slice ([] 1 2 3 4) 1 2
    {}
      :name |&concat
      :tags $ #{} :native
      :desc "|native list concatenation of 2 lists"
      :snippets $ []
        quote $ &concat ([] 1 2) ([] 3 4)
    {}
      :name |format-ternary-tree
      :tags $ #{} :native
      :desc "|disply string form of internal ternary tree structure"
      :snippets $ []
        quote $ format-ternary-tree $ [] 1 2 3 4 5 6
        quote $ format-ternary-tree $ {}
          :a 1
          :b 2
          :c 3
    {}
      :name |merge
      :wip? true
      :tags $ #{} :native
      :desc "|merge multiple lists"
      :snippets $ []
        quote $ merge
          {} (:a 1)
          {} (:b 2)
    {}
      :name |contains?
      :tags $ #{} :native
      :wip? true
      :desc "|check if key is contained in map, should work for sets as well"
      :snippets $ []
        quote $ contains? ({} (:a 1) (:b 2)) :a
    {}
      :name |assoc-before
      :tags $ #{} :native
      :desc "|returns a list with new item associated before specified index"
      :snippets $ []
        quote $ assoc-before ([] 1 2 3) 1 10
    {}
      :name |assoc-after
      :tags $ #{} :native
      :desc "|returns a list with new item associated after specified index"
      :snippets $ []
        quote $ assoc-after ([] 1 2 3) 1 10
    {}
      :name |keys
      :tags $ #{} :native
      :desc "|returns a list of keys of a map"
      :snippets $ []
        quote $ keys $ {} (:a 1) (:b 2)
    {}
      :name |assoc
      :tags $ #{} :native :list :map
      :desc "|returns a list with new item or key/value associated"
      :snippets $ []
        quote $ assoc ([] 1 2 3) 1 :a
        quote $ assoc ({} (:a 1) (:b 2)) :c 10
    {}
      :name |dissoc
      :tags $ #{} :native
      :desc "|returns a list with a key dissociated"
      :snippets $ []
        quote $ dissoc ({} (:a 1) (:b 2)) :a
    {}
      :name |&str
      :tags $ #{} :native
      :desc "|turn a single item into string"
      :snippets $ []
        quote $ &str 1
        quote $ = |keyword $ &str :keyword
    {}
      :name |escape
      :tags $ #{} :native
      :desc "|string escaping"
      :snippets $ []
        quote $ escape "|a b"
    {}
      :name |&str-concat
      :tags $ #{} :native
      :desc "|concat 2 strings"
      :snippets $ []
        quote $ &str-concat |a |b
    {}
      :name |load-cirru-edn
      :tags $ #{} :native
      :wip? true
      :desc "|load data from Cirru EDN format, from a relative file path"
      :snippets $ []
        quote $ load-cirru-edn |demo.cirru
    {}
      :name |sqrt
      :tags $ #{} :native
      :desc "|square root of number"
      :snippets $ []
        quote $ sqrt 9
    {}
      :name |ceil
      :tags $ #{} :native
      :desc "|ceil of a float"
      :snippets $ []
        quote $ ceil 1.1
    {}
      :name |floor
      :tags $ #{} :native
      :desc "|floor of a float"
      :snippets $ []
        quote $ floor 1.1
    {}
      :name |sin
      :tags $ #{} :native
      :desc "|sin of a number"
      :snippets $ []
        quote $ sin 0.1
    {}
      :name |cos
      :tags $ #{} :native
      :desc "|cos of a number"
      :snippets $ []
        quote $ cos 0.1
    {}
      :name |round
      :tags $ #{} :native
      :desc "|round a float number"
      :snippets $ []
        quote $ round 1.1
    {}
      :name |pow
      :tags $ #{} :native
      :desc "|power of a number"
      :snippets $ []
        quote $ pow 2 2
    {}
      :name |#{}
      :tags $ #{} :native :set
      :desc "|hashset. it' based on Nim's hashset, might be slower"
      :snippets $ []
        quote $ #{} 1 2 3 4
    {}
      :name |&include
      :tags $ #{} :native :set
      :desc "|include an item into a hashset"
      :snippets $ []
        quote $ &include (#{} 1 2 3) 4
    {}
      :name |&exclude
      :tags $ #{} :native :set
      :desc "|exclude an item out of a hashset"
      :snippets $ []
        quote $ &exclude (#{} 1 2 3 4) 4
    {}
      :name |&difference
      :tags $ #{} :native :set
      :desc "|difference of two hashsets"
      :snippets $ []
        quote $ &difference (#{} 1 2 3 4) (#{} 1 2)
    {}
      :name |&union
      :tags $ #{} :native
      :desc "|union of two hashsets"
      :snippets $ []
        quote $ &difference (#{} 1 2) (#{} 3 4)
    {}
      :name |&intersection
      :tags $ #{} :native
      :desc "|intersection of two hashsets"
      :snippets $ []
        quote $ &intersection (#{} 1 2) (#{} 2 3)
    {}
      :name |recur
      :tags $ #{} :native
      :desc "|operator for tail recursion, can be used in a function or a loop"
      :snippets $ []
        quote $ defn f (acc n)
          if (< n 10)
            recur (+ acc n) (+ n 1)
            , acc
        quote $ loop
            acc 0
            n 0
          if (< n 10)
            recur (+ acc n) (+ n 1)
            , acc
    {}
      :name |foldl
      :tags $ #{} :native
      :desc "|Haskell's foldl function, implemented i Nim for performance"
      :snippets $ []
        quote $ foldl + acc 0
    {}
      :name |unless
      :tags $ #{} :macro
      :desc "|if-not syntax"
      :snippets $ []
        quote $ unless false |false |true
        quote $ unless false |false
    {}
      :name |&!=
      :wip? true
      :tags $ #{}
      :desc "|native implemention of not equalify, of 2 arguments. might be `/=` in future"
      :snippets $ []
        quote $ != 1 2
    {}
      :name |&<=
      :tags $ #{} :number
      :desc "|native implemention of <=, of 2 arguments"
      :snippets $ []
        quote $ <= 1 2
    {}
      :name |&>=
      :tags $ #{} :number
      :desc "|native implemention of >=, of 2 arguments"
      :snippets $ []
        quote $ >= 2 1
    {}
      :name |when
      :tags $ #{}
      :desc "|if with no false branch"
      :snippets $ []
        quote $ when true
          echo 1
          echo 2
    {}
      :name |+
      :tags $ #{} :number
      :desc "|add multiple numbers"
      :snippets $ []
        quote $ + 1 2
        quote $ + 1 2 3
    {}
      :name |-
      :tags $ #{} :number
      :desc "|substract numbers from a number"
      :snippets $ []
        quote $ - 2 1
        quote $ - 10 1 2 3
    {}
      :name |*
      :tags $ #{} :number
      :desc "|multiply numbers"
      :snippets $ []
        quote $ * 1 2 3
    {}
      :name |/
      :tags $ #{} :number
      :desc "|division of multiple numbers"
      :snippets $ []
        quote $ / 12 3 4
    {}
      :name |foldl-compare
      :tags $ #{}
      :desc "|internal function for generation comparing functions"
      :snippets $ []
        quote $ foldl-compare &< ([] 2 3 4) 1
    {}
      :name |<
      :tags $ #{} :number
      :desc "|compare multiple numbers"
      :snippets $ []
        quote $ < 1 2 3 4
    {}
      :name |>
      :tags $ #{} :number
      :desc "|compare multiple numbers"
      :snippets $ []
        quote $ > 4 3 2 1
    {}
      :name |=
      :tags $ #{} :number
      :desc "|compare multiple numbers"
      :snippets $ []
        quote $ = 1 (- 2 1) (- 4 3)
    {}
      :name |!=
      :wip? true
      :tags $ #{}
      :desc "|compare multiple numbers"
      :snippets $ []
        quote $ != 1 2 3 4
    {}
      :name |>=
      :tags $ #{} :number
      :desc "|compare multiple numbers"
      :snippets $ []
        quote $ >= 4 3 2
    {}
      :name |<=
      :tags $ #{}
      :desc "|compare multiple numbers"
      :snippets $ []
        quote $ <= 2 3 4
    {}
      :name |apply
      :tags $ #{}
      :desc "|apply a list of arguments to a function"
      :snippets $ []
        quote $ apply f $ [] 1 2 3 4
    {}
      :name |list?
      :tags $ #{}
      :desc "|detects a list"
      :snippets $ []
        quote $ list? $ [] 1 2 3 4
    {}
      :name |map?
      :tags $ #{}
      :desc "|detects a map"
      :snippets $ []
        quote $ map? $ {} (:a 1) (:b 2)
    {}
      :name |number?
      :tags $ #{}
      :desc "|detects a number"
      :snippets $ []
        quote $ number? 1
    {}
      :name |string?
      :tags $ #{}
      :desc "|detects a string"
      :snippets $ []
        quote $ string? |demo
    {}
      :name |keyword?
      :tags $ #{}
      :desc "|detects a keyword"
      :snippets $ []
        quote $ keyword? :key
    {}
      :name |symbol?
      :tags $ #{}
      :desc "|detects a symbol"
      :snippets $ []
        quote $ symbol? 'a
    {}
      :name |bool?
      :tags $ #{}
      :desc "|detects a bool"
      :snippets $ []
        quote $ bool? true
    {}
      :name |nil?
      :tags $ #{}
      :desc "|detects a nil"
      :snippets $ []
        quote $ nil? nil
    {}
      :name |each
      :tags $ #{} :list
      :desc "|take a list and a function and call each item with function"
      :snippets $ []
        quote $ each ([] 1 2 3 4) $ fn (x)
          echo x
    {}
      :name |map
      :tags $ #{}
      :desc "|map items of list into a new list"
      :snippets $ []
        quote $ map ([] 1 2 3 4) $ fn (x)
          + x 1
    {}
      :name |take
      :tags $ #{}
      :desc "|take n items from list"
      :snippets $ []
        quote $ take 2 $ [] 1 2 3 4 5
    {}
      :name |drop
      :tags $ #{}
      :desc "|take items of a list except for first n items"
      :snippets $ []
        quote $ drop 2 $ [] 1 2 3 4 5
    {}
      :name |str
      :tags $ #{} :string
      :desc "|string concatenation"
      :snippets $ []
        quote $ str |a 1 :k
    {}
      :name |include
      :tags $ #{} :set
      :desc "|include multiple items to hashset"
      :snippets $ []
        quote $ include (#{} 1 2) 3 4
    {}
      :name |exclude
      :tags $ #{}
      :desc "|exclude multiple items from hashset"
      :snippets $ []
        quote $ exclude (#{} 1 2 3 4) 1 2
    {}
      :name |difference
      :tags $ #{}
      :desc "|return a difference hashset of 2 hashsets"
      :snippets $ []
        quote $ difference (#{} 1 2 3 4) (#{} 1 2) (#{} 3)
    {}
      :name |union
      :tags $ #{}
      :desc "|return a union hashset of 2 hashsets"
      :snippets $ []
        quote $ union (#{} 1 2) (#{} 3 4) (#{} 5 6)
    {}
      :name |intersection
      :tags $ #{} :set
      :desc "|return a intersection hasset of multiple hashsets"
      :snippets $ []
        quote $ intersection (#{} 1 2 3) (#{} 2 3 4) (#{} 3 4 5)
    {}
      :name |&index-of
      :tags $ #{}
      :desc "|helper function for index-of"
      :snippets $ []
        quote $ index-of ([] 1 2 3 4) 1
    {}
      :name |index-of
      :tags $ #{} :list
      :desc "|native implemention of `indexOf` function, returns -1 when not found"
      :snippets $ []
        quote $ index-of ([] 1 2 3 4) 1
    {}
      :name |&find-index
      :tags $ #{}
      :desc "|helper function for find-index"
      :snippets $ []
        quote $ find-index ([] 1 2 3 4) $ fn (x) (> x 2)
    {}
      :name |find-index
      :tags $ #{} :list
      :desc "|find index of first item that matches the function, returns -1 when not found"
      :snippets $ []
        quote $ find-index ([] 1 2 3 4) $ fn (x) (> x 2)
    {}
      :name |find
      :tags $ #{} :list
      :desc "|find first item from list that matches the function"
      :snippets $ []
        quote $ find ([] 1 2 3 4) $ fn (x) (> x 2)
    {}
      :name |->
      :tags $ #{} :macro
      :desc "|thread macro for nested functions, argument at head"
      :snippets $ []
        quote $ -> a (b) (c d)
    {}
      :name |->>
      :tags $ #{} :macro
      :desc "|thread macro for nested functions, argument at tail"
      :snippets $ []
        quote $ ->> a (b) (c d)
    {}
      :name |cond
      :tags $ #{} :macro
      :desc "|like Clojure cond, but using `true` for else case"
      :snippets $ []
        quote $ cond
          (> a 10) |>10
          (> a 1) |>1
          true |false
    {}
      :name |case
      :tags $ #{} :macro
      :desc "|like Clojure case, but using value itself for else case"
      :snippets $ []
        quote $ case a
          :a |a
          :b |b
          a |else
    {}
      :name |get-in
      :tags $ #{}
      :desc "|like Clojure get-in function, read property recursively"
      :snippets $ []
        quote $ get data $ [] :a 1
    {}
      :name |&max
      :tags $ #{} :number
      :desc "|native implemention of max, takes 2 arguments"
      :snippets $ []
        quote $ &max 1 2
    {}
      :name |&min
      :tags $ #{} :number
      :desc "|native implemention of min, takes 2 arguments"
      :snippets $ []
        quote $ &min 1 2
    {}
      :name |max
      :tags $ #{} :list
      :desc "|max function that takes a list of arguments"
      :snippets $ []
        quote $ max $ [] 1 2 3 4
    {}
      :name |min
      :tags $ #{} :list
      :desc "|max function that takes a list of arguments"
      :snippets $ []
        quote $ min $ [] 1 2 3 4
    {}
      :name |every? :list
      :tags $ #{}
      :desc "|detects if every item in list satisfies function"
      :snippets $ []
        quote $ every? (fn (x) (> x 1)) ([] 1 2 3 4)
    {}
      :name |any? :list
      :tags $ #{}
      :desc "|detects if any item in list satisfies function"
      :snippets $ []
        quote $ every? (fn (x) (> x 1)) ([] 1 2 3 4)
    {}
      :name |concat :list
      :tags $ #{}
      :desc "|concat mutiple lists"
      :snippets $ []
        quote $ concat ([] 1 2) ([] 3 4) ([] 5 6)
    {}
      :name |mapcat
      :tags $ #{} :list
      :desc "|map item to list and then concat, or just flatmap"
      :snippets $ []
        quote $ mapcat
          fn (x) ([] x (+ x 10))
          [] 1 2 3 4
