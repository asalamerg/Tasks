
class Validators{

  static String? TitleValidator(String? value){
    if (value == null || value.trim().isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

}