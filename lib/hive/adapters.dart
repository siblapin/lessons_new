import 'package:alpha16/models/dhikr.dart';
import 'package:hive/hive.dart';

class DhikrAdapter extends TypeAdapter<Dhikr> {
  @override
  final int typeId = 0; // свойства

  @override
  Dhikr read(BinaryReader reader) {
    // read считать данные
    int counter = reader.readInt();
    String title = reader.readString();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(reader.readInt());
    return Dhikr(counter: counter, title: title, date: date);
  }

  @override
  void write(BinaryWriter writer, Dhikr obj) {
    // write записывать
    writer.writeInt(obj.counter);
    writer.writeString(obj.title);
    writer.writeInt(obj.date.microsecondsSinceEpoch);
  }
}
