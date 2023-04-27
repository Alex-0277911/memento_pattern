pattern Memento in Dart

 У цьому прикладі ми маємо клас Editor, який містить деякий текст.
 Метод write дозволяє нам задати текст, а метод getText повертає його.
 Ми також додали два додаткові методи для підтримки шаблону Memento:
 save і restore.

 У цьому прикладі ми створюємо новий об'єкт Editor і об'єкт Caretaker для
 керування ним. Ми встановлюємо текст "Hello, world!" і зберігаємо стан за
 допомогою методу save. Потім ми змінюємо текст на "Goodbye, world!" і
 виводимо його за допомогою методу getText.

 Потім викликаємо undo, щоб відновити стан редактора до попередньо
 збереженого. Ми знову виводимо текст за допомогою getText, щоб підтвердити,
 що стан було відновлено.