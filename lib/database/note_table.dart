
import 'package:floor/floor.dart';

@Entity(tableName:'note')
class Note {
  @primaryKey
  String id;
  String title;
  String message;
  Note(
    this.id, 
    this.title,
    this.message,
    
  );
factory Note.fromJson(Map<String, dynamic> json) =>Note(json['id'],json['title'], json['message']);

  Map<String, dynamic> toJson() => {"id": id, "title": title, "message": message};
  

  @override
  String toString(){
    return 'Note(id: $id, title:$title, message:$message)';
  }
}
