# Развитие macOS/AArch64 в OpenJDK

## Цели 

1. Бекпорт реализации JEP-391 в OpenJDK 15, 13, 11, 8
2. Развитие порта в mainline: улучшение Write-xor-Execute, исправление в JVMCI, ускорение JNI,..
   - [Открытые баги](https://bugs.openjdk.java.net/issues/?jql=cpu%20%3D%20aarch64%20AND%20os%20%3D%20os_x%20AND%20status%20not%20in%20(resolved%2C%20closed))

## Текущие задачи

Отслеживаются в https://github.com/azul-research/macos-aarch64/projects/1

## Процесс

Накапливаем очередь для бекпортов в azul-research/jdkNN-dev:macos-aarch64.
Строго линейная последовательность коммитов без мёржей.

Для каждого сбекпортированного фикса имеется по крайней мере один коммит следующего формата
* diff -- в точности результат применения патча на дерево с исходным кодом, даже с конфликтами
* описание в формате
```
8253638: Cleanup os::reserve_memory and remove MAP_FIXED

Backport 625a9352bfdc017f426c3bd2a5c24b0f7598ccce
```

Если патч в неудовлетворительном состояии (были конфликты, ..., не проходят тесты,...), добавляем коммиты формата
```
fixup! 8253638: Cleanup os::reserve_memory and remove MAP_FIXED
```
