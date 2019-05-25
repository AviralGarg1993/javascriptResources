# Kotlin Reference Sheet

This reference summarizes several topics covered in a [Udacity Course][1] in the form of code snippets.

## Lesson 0

- Install JDK if you don't have it
- Download  IntelliJ
- Starting the interpreter: Tools > Kotlin > Kotlin REPL

## Lesson 1

### Hello Kotlin function
```kotlin
fun printHello () {
   println ("Hello Kotlin")
}
printHello()
```

### Hello Kotlin program
```kotlin
fun main (args: Array<String>) {
  println("Hello ${args[0]} ")
}
```

### Operators

```kotlin
fish.times(6) // *
fish.div(10)  // /
fish.plus(3)  // +
fish.minus(3) // -
```

### Type conversion

```kotlin
1.toLong()
1.toString()
```

### Number formatting

```kotlin
val oneMillion = 1_000_000
val socialSecurityNumber = 999_99_9999L
```

### val (immutable) & var (mutable)

```kotlin
val aquarium = "my aquarium"
var fish = 50
var snails : Int = 12
```

### Nullability

```kotlin
var rocks: Int = null //Error
var marbles: Int? = null
fishFoodTreats?.dec()
```

```kotlin
var lotsOfFish: List<String?> = listOf(null, null)
```

```kotlin
return fishFoodTreats?.dec() ?:0
goldfish!!.eat
```

### Strings / String Templates

```kotlin
"hello" + "fish" + "!"
"I have $numberOfFish fish"
"Print ${ numberOfFish + 5 } fish"
"fish" == "fish"
val message = "You are ${ if (length < 5) "fried" else "safe" } fish"
```

### if/else

```kotlin
if (numberOfFish > numberOfPlants) {
  println("Good ratio!")
} else {
   println("unhealthy ratio")
}
```

```kotlin
if (fish in 1..100) println(fish)
```

```kotlin
val isHot =
 if (temperature > 90) true else false
```

### When

```kotlin
when (numberOfFish) {
  0  -> println("Empty tank")
  in 1..50 -> println("Got fish!")
  else -> println("Perfect!")
}
```

### listOf / mutableListOf

```kotlin
val myList = mutableListOf("tuna",,"shark")

myList.remove("shark") // OK!

val swarm = listOf(fish, plants)
```

### arrayOf / mutableArrayOf / intArray…

```kotlin
val school = arrayOf("tuna","salmon","shark")
val mix = arrayOf("fish", 2)
```

```kotlin
println(Arrays.toString(intArrayOf(2, "foo")))
```

```kotlin
val bigSwarm = arrayOf(swarm, arrayOf("dolphin","whale","orka"))
val array = Array (5) { it * 2 }
```

### for loop

```kotlin
for (element in swarm) {...}
```

```kotlin
for ((index, element) in swarm.withIndex()) {
   println("Fish at $index is $element")
}
```

```kotlin
for (i in 'b'..'g') print(i)
```

```kotlin
for (i in 1..5) print(i)
```

```kotlin
for (i in 5 downTo 1) print(i)
```

```kotlin
for (i in 3..6 step 2) print(i) // Prints: 35
```


## Lesson 2

### Functions

```kotlin
fun randomDay(): String {return "Monday"}
```

```kotlin
fun fishFood (hour: Int, day: String = "Tuesday"): String {}
```

```kotlin
fun isTooHot(temperature: Int): Boolean = temperature > 30
```

### Compact Functions

```kotlin
fun isTooHot(temperature: Int) = temperature > 30
```

```kotlin
fun shouldChangeWater (day: String, temperature: Int = 22, dirty: Int = 20): Boolean {
   return when {
     isTooHot(temperature)-> true
     else  -> false
   }
}
```

```kotlin
fun getDirtySensorReading() = return 20
```

```kotlin
fun shouldChangeWater (day: String, temperature: Int = 22, dirty: Int = getDirtySensorReading()) {...}
```

### Filters

```kotlin
println( decorations.filter {it[0] == 'p'})
```

### Lambdas (anonymous functions)

```kotlin
{ println("Hello") }()
```

```kotlin
val waterFilter = { dirty: Int -> dirty / 2 }
```

```kotlin
val waterFilter : (Int) -> Int = { dirty -> dirty / 2 }
```

### Higher order functions (fun with fun arg)

```kotlin
fun updateDirty(dirty: Int, operation: (Int) -> Int): Int {
  return operation(dirty)
}
updateDirty(50, ::increaseDirty)
```


## Lesson 3

### Class

```kotlin
class Aquarium(var length: Int = 100, var width: Int = 20, var height: Int = 40) {
  constructor(numOfFish: Int): this() {
    init {
      // do stuff
    }

    val volume: Int
      get() {
        return w * h * l / 1000
      }
    init {
      // do stuff with volume
    }
  }
```

### Visibility

#### package:

```kotlin
public   // default. Everywhere
private  // file
internal  // module
```

#### class:

```kotlin
sealed   // only subclass in same file
```

#### inside class:

```kotlin
public   // default. Everywhere.
private  // inside class, not subclasses
protected // inside class and subclasses
internal  // module
```

### Inheritance

```kotlin
open class Aquarium ….. {
  open var water = volume * 0.9
  open var volume
}

class TowerTank (): Aquarium() {
  override var volume: Int
    get() = (w * h * l / 1000 * PI).toInt()
    set(value) {
      h = (value * 1000) / (w * l)}
}
```

### Abstract classes

```kotlin
abstract class AquariumFish {
  abstract val color: String
}

class Shark: AquariumFish() {
  override val color = "gray"
}

class Plecostomus: AquariumFish() {
  override val color = "gold"
}
```

### Interfaces

```kotlin
interface FishAction  {
  fun eat()
}

class Shark: AquariumFish(), FishAction {
  override val color = "gray"
  override fun eat() {
    println("hunt and eat fish")
  }
}

fun feedFish(fish: FishAction) {
  // make some food then
   fish.eat()
}
```

### Data Classes

```kotlin
data class Decorations(val rocks: String, val wood: String, val diver: String){
}
val d = Decorations("crystal", "wood", "diver")
val (rock, wood, diver) = d
```


```kotlin
dataClassInstance1.equals(dataClassInstance2)
val dataClassInstance3.copy(dataClassInstance2)
```

### Composition

```kotlin
fun main (args: Array<String>) {
  delegate()
}

fun delegate() {
  val pleco = Plecostomus()
  println("Fish has has color ${pleco.color}")
  pleco.eat()
}

interface FishAction {
  fun eat()
}

interface FishColor {
  val color: String
}

object GoldColor : FishColor {
  override val color = "gold"
}

class PrintingFishAction(val food: String) : FishAction {
  override fun eat() {
    println(food)
  }
}

class Plecostomus (fishColor: FishColor = GoldColor):
FishAction by PrintingFishAction("eat a lot of algae"),
FishColor by fishColor
```

### Singleton / object

#### object Database

```kotlin
object MobyDickWhale {
   val author = "Herman Melville"
}
```

### enum

```kotlin
enum class Color(val rgb: Int) {
  RED(0xFF0000), GREEN(0x00FF00), BLUE(0x0000FF);
}
Color.RED
```


## Lesson 4

### Pairs

```kotlin
val equipment = "fishnet" to "catching fish"
println(equipment.first)
println(equipment.second)

val (tool, use) = fishnet
val fishnetString = fishnet.toString()
println(fishnet.toList())
```

### Nesting with parentheses:

```kotlin
val equip = ("fishnet" to "catching fish") to ("of big size" to "and strong")
equipment.first.first
```

### Lists

```kotlin
val testList = listOf(11,12,13,14,15,16,17,18,19,20)
listOf<Int>(1,2,3,4,5,6,7,8,9,0).reversed()

var symptoms = mutableListOf("white spots", "red spots", "not eating", "bloated", "belly up")
symptoms.add("white fungus")
symptoms.remove("white fungus")
symptoms.contains("red")
println(symptoms.subList(4, symptoms.size))

listOf(1, 5, 3).sum()
listOf("a", "b", "cc").sumBy { it.length }
```

### Mapping

```kotlin
val cures = hashMapOf("white spots" to "Ich", "red sores" to "hole disease")

println(cures["white spots"])
cures.getOrDefault("bloating", "sorry, I don't know")
cures.getOrElse("bloating") {"No cure for this"}
val inventory = mutableMapOf("fish net" to 1)

inventory.put("tank scrubber", 3)
inventory.remove("fish net")
```

### Constants

```kotlin
const val CONSTANT = "top-level constant" // compile time
object Constants {
const val CONSTANT2 = "object constant"
}

class MyClass {
   companion object {
const val CONSTANT3 = "constant in companion"
   }
}
```

### Extension functions

```kotlin
fun String.hasSpaces(): Boolean {
  val found = this.find { it == ' ' }
  return found != null
}
```

```kotlin
fun extensionExample() {
  “Does it have spaces?”.hasSpaces()
}
```

```kotlin
⇒ fun String.hasSpaces() = find { it == ' ' } != null
```

```kotlin
fun AquariumPlant.isRed() = color == "red"
```

```kotlin
fun AquariumPlant?.pull() {
  this?.apply {
    println("removing $this")
  }
}
```

### Property extensions

```kotlin
val AquariumPlant.isGreen: Boolean
  get() = color == "green"

fun propertyExample() {
  val plant = GreenLeafyPlant(30)
  plant.isGreen // true
}
```

### Generic classes

```kotlin
class MyList<T> {
  fun get(pos: Int): T {
  TODO("implement")
}

fun addItem(item: T) {}
}
```

```kotlin
fun workWithMyList() {
  val intList: MyList<String>
  val fishList: MyList<Fish>
}
```

### Generics: Full example

```kotlin
open class WaterSupply(var needsProcessed: Boolean)
class TapWater : WaterSupply(true) {
  fun addChemicalCleaners() {
    needsProcessed = false
  }
}


class FishStoreWater : WaterSupply(false)

class LakeWater : WaterSupply(true) {
  fun filter() {
    needsProcessed = false
  }
}


class Aquarium<T>(val waterSupply: T)

fun genericsExample() {
  val aquarium = Aquarium(TapWater())
aquarium.waterSupply.addChemicalCleanes()
}
```

### Generic constraint

### Non-nullable:

```kotlin
class Aquarium<T: Any>(val waterSupply: T)

class Aquarium<T: WaterSupply>(val waterSupply: T)
```

### In and Out Types

```kotlin
class Aquarium<out T: WaterSupply>(val waterSupply: T) { …}

interface Cleaner<in T: WaterSupply> {
  fun clean(waterSupply: T)
}
```

### Generic functions and methods

```kotlin
fun <T: WaterSupply> isWaterClean(aquarium: Aquarium<T>) {
  println("aquarium water is clean: ${aquarium.waterSupply.needsProcessed}")
}
```


```kotlin
fun genericsFunExample() {
  val aquarium = Aquarium(TapWater())

  isWaterClean(aquarium)
}
```


```kotlin
fun <R: WaterSupply> hasWaterSupplyOfType() = waterSupply is R
```

### Inline / reified

```kotlin
inline fun <reified R: WaterSupply> hasWaterSupplyOfType() = waterSupply is R
```


```kotlin
inline fun <reified T: WaterSupply> WaterSupply.isOfType() = this is T
```


```kotlin
inline fun <reified R: WaterSupply> Aquarium<*>.hasWaterSupplyOfType() = waterSupply is R
```


### Annotations

```kotlin
@file:JvmName(“InteropFish”)
```

```kotlin
@JvmStatic fun interop()
```

### annotation class ImAPlant

```kotlin
@ImAPlant class Plant{...}

val plantObject = Plant::class
for (a in plantObject.annotations) {
  println(a.annotationClass.simpleName)
}
```

### Reflection

```kotlin
val classobj=Plant::class
for(m in classobj.declaredMemberFunctions){
  println(m.name)
}
```


### Annotations for getters and setters

```kotlin
@Target(PROPERTY_GETTER)
annotation class OnGet
@Target(PROPERTY_SETTER)
Annotation class OnSet

@ImAPlant class Plant {
  @get:OnGet
  val isGrowing: Boolean = true

  @set:OnSet
  var needsFood: boolean = false
}
```

### Labeled breaks

```kotlin
fun labels() {
  loop@ for (i in 1..100) {
    for (j in 1..100) {
  if (i > 10) break@loop
  }
  }
}
```

## Lesson 5

### Lambda recap

```kotlin
myFish.filter { it.name.contains("i")}.joinToString (" ") { it.name }
```

### Higher order function

```kotlin
fun myWith(name: String, block: String.() -> Unit) {
   name.block()
}
```

### Standard Library: apply & run

```kotlin
fish.run {
  name
}

val fish2 = Fish().apply {
    name = “sharky”
}
```

### Standard Library: with & repeat

```kotlin
with(fish.name) {
  println(name)
}

repeat(3) { rep ->
   println(" current repetition: $rep")}
```

### Inline

```kotlin
Inline fun myWith(name: String, operation: String.() -> Unit) {
   name.operation()
}
```

### Lambda instead ofSAM

```kotlin
fun example() {
  runNow {
    println(“Passing a lambda as a Runnable”)
}
```

[1]: https://www.udacity.com/course/kotlin-bootcamp-for-programmers--ud9011
