import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Visualization Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SalesChart(),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ProductChart(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: LineChart(),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: BarChart(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesChart extends StatefulWidget {
  @override
  _SalesChartState createState() => _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  List<SalesData> salesData = [
    SalesData('Jan', 100),
    SalesData('Feb', 200),
    SalesData('Mar', 150),
    SalesData('Apr', 300),
    SalesData('May', 400),
    SalesData('Jun', 200),
  ];

  String selectedMonth = 'All';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Resident Chart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedMonth,
                  items: _buildDropdownItems(salesData),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              ColumnSeries<SalesData, String>(
                dataSource: _getFilteredSalesData(),
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.amount,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<SalesData> data) {
    List<DropdownMenuItem<String>> items = [];
    items.add(DropdownMenuItem<String>(value: 'All', child: Text('All')));
    for (SalesData sales in data) {
      items.add(DropdownMenuItem<String>(
        value: sales.month,
        child: Text(sales.month),
      ));
    }
    return items;
  }

  List<SalesData> _getFilteredSalesData() {
    if (selectedMonth == 'All') {
      return salesData;
    } else {
      return salesData.where((sales) => sales.month == selectedMonth).toList();
    }
  }
}

class ProductChart extends StatefulWidget {
  @override
  _ProductChartState createState() => _ProductChartState();
}

class _ProductChartState extends State<ProductChart> {
  List<ProductData> productData = [
    ProductData('Product A', 50),
    ProductData('Product B', 80),
    ProductData('Product C', 120),
    ProductData('Product D', 200),
  ];

  String selectedProduct = 'All';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Age Chart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedProduct,
                  items: _buildDropdownItems(productData),
                  onChanged: (value) {
                    setState(() {
                      selectedProduct = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<ProductData, String>(
                dataSource: _getFilteredProductData(),
                xValueMapper: (ProductData product, _) => product.name,
                yValueMapper: (ProductData product, _) => product.quantity,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<ProductData> data) {
    List<DropdownMenuItem<String>> items = [];
    items.add(DropdownMenuItem<String>(value: 'All', child: Text('All')));
    for (ProductData product in data) {
      items.add(DropdownMenuItem<String>(
        value: product.name,
        child: Text(product.name),
      ));
    }
    return items;
  }

  List<ProductData> _getFilteredProductData() {
    if (selectedProduct == 'All') {
      return productData;
    } else {
      return productData
          .where((product) => product.name == selectedProduct)
          .toList();
    }
  }
}

class LineChart extends StatefulWidget {
  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<ChartData> chartData = [
    ChartData('Jan', 100),
    ChartData('Feb', 200),
    ChartData('Mar', 150),
    ChartData('Apr', 300),
    ChartData('May', 400),
    ChartData('Jun', 200),
  ];

  String selectedMonth = 'All';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Line Chart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedMonth,
                  items: _buildDropdownItems(chartData),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              LineSeries<ChartData, String>(
                dataSource: _getFilteredChartData(),
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.value,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<ChartData> data) {
    List<DropdownMenuItem<String>> items = [];
    items.add(DropdownMenuItem<String>(value: 'All', child: Text('All')));
    for (ChartData chartData in data) {
      items.add(DropdownMenuItem<String>(
        value: chartData.month,
        child: Text(chartData.month),
      ));
    }
    return items;
  }

  List<ChartData> _getFilteredChartData() {
    if (selectedMonth == 'All') {
      return chartData;
    } else {
      return chartData.where((data) => data.month == selectedMonth).toList();
    }
  }
}

class BarChart extends StatefulWidget {
  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  List<ChartData> chartData = [
    ChartData('Jan', 100),
    ChartData('Feb', 200),
    ChartData('Mar', 150),
    ChartData('Apr', 300),
    ChartData('May', 400),
    ChartData('Jun', 200),
  ];

  String selectedMonth = 'All';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Bar Chart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedMonth,
                  items: _buildDropdownItems(chartData),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              BarSeries<ChartData, String>(
                dataSource: _getFilteredChartData(),
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.value,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<ChartData> data) {
    List<DropdownMenuItem<String>> items = [];
    items.add(DropdownMenuItem<String>(value: 'All', child: Text('All')));
    for (ChartData chartData in data) {
      items.add(DropdownMenuItem<String>(
        value: chartData.month,
        child: Text(chartData.month),
      ));
    }
    return items;
  }

  List<ChartData> _getFilteredChartData() {
    if (selectedMonth == 'All') {
      return chartData;
    } else {
      return chartData.where((data) => data.month == selectedMonth).toList();
    }
  }
}

class SalesData {
  final String month;
  final int amount;

  SalesData(this.month, this.amount);
}

class ProductData {
  final String name;
  final int quantity;

  ProductData(this.name, this.quantity);
}

class ChartData {
  final String month;
  final int value;

  ChartData(this.month, this.value);
}
