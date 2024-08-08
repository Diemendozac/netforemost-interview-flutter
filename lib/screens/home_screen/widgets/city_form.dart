import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:interview_flutter/services/city_service.dart';

class AddCityForm extends StatefulWidget {
  const AddCityForm({super.key});

  @override
  AddCityFormState createState() => AddCityFormState();
}

class AddCityFormState extends State<AddCityForm> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final CityService cityService = CityService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _cityKey = '';
  bool _isCitySelected = false;

  void _onCitySelected(String city) {
    setState(() {
      _isCitySelected = true;
      _cityController.text = city;
      _cityKey = 'cityKey';
    });
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildDivider(),
            TypeAheadField<String>(
              suggestionsCallback: (search) {
                if (search.isNotEmpty) {
                  return cityService.getCitySuggestions(search);
                }
                return [''];
              },
              builder: (context, controller, focusNode) {
                return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffix: controller.text.isNotEmpty
                          ? _buildDeleteIcon(_cityController, controller)
                          : null,
                      labelText: 'City',
                    )
                );
              },
              itemBuilder: (context, city) {
                return ListTile(
                  title: Text(city),
                );
              },
              onSelected: (city) {
                _onCitySelected(city, );
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return colorScheme.tertiary;
                        }
                        return colorScheme.primary;
                      },
                    ),
                  ),
                  statesController: MaterialStatesController(

                  ),
                  onPressed: _formKey.currentState?.validate() == true
                      ? () {
                    _formKey.currentState?.save();
                    print('City: ${_cityController.text}');
                    print('City Key: $_cityKey');
                    print('Description: ${_descriptionController.text}');
                  }
                      : null,
                  child: const Text('Save City'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 4,
      width: 32,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  Widget _buildDeleteIcon(TextEditingController controller, TextEditingController inputController) {
    return IconButton(
      icon: const Icon(Icons.cancel),
      onPressed: () {
        controller.clear();
        inputController.clear();
        setState(() {
          _isCitySelected = false;
          _cityKey = '';
        });
      },
    );
  }
}
