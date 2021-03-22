class Row {
  String letters;

  Row(this.letters);

  List<String> characters() {
    List<String> ret = [];
    ret = this.letters.split('');
    ret.map((e) => e.toUpperCase());
    return ret;
  }
}
