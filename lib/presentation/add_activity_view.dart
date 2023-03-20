import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_my_life_in_order/application/activities/controller/activities_controller_bloc.dart';

import '../application/navigation/navigation_bloc.dart';
import '../domain/entities/activity.dart';

@RoutePage()
class AddActivityView extends StatelessWidget {
  const AddActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add an Activity"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: AddActivityForm(),
      ),
    );
  }
}

class AddActivityForm extends StatefulWidget {
  const AddActivityForm({super.key});

  @override
  State<AddActivityForm> createState() => _AddActivityFormState();
}

class _AddActivityFormState extends State<AddActivityForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationBloc = context.read<NavigationBloc>();
    final actCtrlBloc = context.read<ActivitiesControllerBloc>();
    final router = AutoRouter.of(context);
    return WillPopScope(
      onWillPop: () {
        navigationBloc.add(GoBack(router));
        return Future<bool>(() => false);
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter the Activity's Name",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        actCtrlBloc.add(ActivitiesControllerEvent.addActivity(
                            Activity(name: nameController.text)));
                        navigationBloc.add(GoBack(router));
                      }
                    },
                    child: const Text('Save'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //TODO ask before cancel
                      navigationBloc.add(GoBack(router));
                    },
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
