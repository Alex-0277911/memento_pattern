// pattern Memento in Dart

// У цьому прикладі ми маємо клас Editor, який містить деякий текст.
// Метод write дозволяє нам задати текст, а метод getText повертає його.
// Ми також додали два додаткові методи для підтримки шаблону Memento:
// save і restore.

class Editor {
  String _text = '';

  void write(String text) {
    _text = text;
  }

  String getText() {
    return _text;
  }

// Метод save створює новий об'єкт Memento з поточним станом редактора і
// повертає його. Метод restore отримує об'єкт Memento і відновлює стан
// редактора до стану, збереженого в Memento.

  Memento save() {
    return Memento(_text);
  }

  void restore(Memento memento) {
    _text = memento.getState();
  }
}

// Клас Memento просто зберігає стан редактора. Він має єдиний метод getState,
// який повертає збережений стан.

class Memento {
  final String _state;

  Memento(this._state);

  String getState() {
    return _state;
  }
}

// Нарешті, у нас є клас Caretaker, який керує списком об'єктів Memento.
// Метод save додає нову пам'ятку до списку, а метод undo видаляє останню
//пам'ятку зі списку і використовує її для відновлення стану редактора.

class Caretaker {
  final List<Memento> _mementos = [];
  final Editor _editor;

  Caretaker(this._editor);

  void save() {
    _mementos.add(_editor.save());
  }

  void undo() {
    if (_mementos.isEmpty) return;

    final memento = _mementos.removeLast();
    _editor.restore(memento);
  }
}

// Завдяки такій реалізації ми можемо використовувати клас Caretaker для
// збереження і відновлення стану редактора. Наприклад:

void main() {
  final editor = Editor();
  final caretaker = Caretaker(editor);

  // записуємо текст
  editor.write('Hello, world!');
  // зберігаємо стан
  caretaker.save();
  print(editor.getText()); // Output: Hello, world!

  // робимо запис іншого тексту
  editor.write('Goodbye, world!'); // Set the text again
  print(editor.getText()); // Output: Goodbye, world!

  caretaker.undo(); // Restore the state
  print(editor.getText()); // Output: Hello, world!
}

// У цьому прикладі ми створюємо новий об'єкт Editor і об'єкт Caretaker для
// керування ним. Ми встановлюємо текст "Hello, world!" і зберігаємо стан за
// допомогою методу save. Потім ми змінюємо текст на "Goodbye, world!" і
// виводимо його за допомогою методу getText.

// Потім викликаємо undo, щоб відновити стан редактора до попередньо
// збереженого. Ми знову виводимо текст за допомогою getText, щоб підтвердити,
// що стан було відновлено.