import 'package:app_superheroes/data/model/superhero_detail_response.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HabilidadesSuperhero {
  HabilidadesSuperhero(this.descripcion, this.valor);
  final String descripcion;
  final double valor;
}

class SuperheroDetailScreen extends StatelessWidget {
  final SuperheroDetailResponse superhero;
  const SuperheroDetailScreen({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Superhero: ${superhero.name}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic
            ),
          ),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                superhero.url,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                superhero.realName,
                style: TextStyle(fontSize: 20, color: Colors.black26),
              ),
              WidgetHabilidades(superhero: superhero),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetHabilidades extends StatefulWidget {

  final SuperheroDetailResponse superhero;

  const WidgetHabilidades({
    super.key,
    required this.superhero,
  });

  @override
  State<WidgetHabilidades> createState() => _WidgetHabilidadesState();
}

class _WidgetHabilidadesState extends State<WidgetHabilidades> {
  
  late final List<HabilidadesSuperhero> data;
  @override
  void initState(){
    super.initState();
    data = [
    HabilidadesSuperhero('Inteligencia', double.parse(widget.superhero.powerStats.intelligence)),
    HabilidadesSuperhero('Fuerza', double.parse(widget.superhero.powerStats.strength)),
    HabilidadesSuperhero('Velocidad', double.parse(widget.superhero.powerStats.speed)),
    HabilidadesSuperhero('Durabilidad', double.parse(widget.superhero.powerStats.durability)),
    HabilidadesSuperhero('Poder', double.parse(widget.superhero.powerStats.power)),
    HabilidadesSuperhero('Combate', double.parse(widget.superhero.powerStats.combat)),
  ];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            isVisible: false,
          ),
          // Chart title
          title: ChartTitle(text: 'Habilidades'),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<HabilidadesSuperhero, String>>[
            LineSeries<HabilidadesSuperhero, String>(
              dataSource: data,
              xValueMapper: (HabilidadesSuperhero valor, _) =>
                  valor.descripcion,
              yValueMapper: (HabilidadesSuperhero valor, _) =>
                  valor.valor,
              name: widget.superhero.name,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}
