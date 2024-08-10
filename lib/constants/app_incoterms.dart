class Incoterm {
  final String code;
  final String description;

  Incoterm(this.code, this.description);
}

class AppIncoterms {
  static List<Incoterm> incoterms = [
    Incoterm("CIF", "Cost, Insurance And Freight"),
    Incoterm("CPT", "Carriage Paid To"),
    Incoterm("CIP", "Carriage And Insurance Paid To"),
    Incoterm("CFR", "Cost And Freight"),
    Incoterm("DAT", "Delivered At Terminal"),
    Incoterm("DAP", "Delivered At Place"),
    Incoterm("DDP", "Delivered Duty Paid"),
  ];
}
