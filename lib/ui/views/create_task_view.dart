import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tasks/ui/constants/color_constants.dart';
import '../../core/viewmodels/views/create_task_viewmodel.dart';
import 'create_task_view.form.dart';
@FormView(fields: [
  FormTextField(name: 'title'),
  FormDateField(name: 'dueDate')
])
class TaskDetailScreen extends StatelessWidget with $TaskDetailScreen {
   TaskDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder<TaskDetailViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
        viewModelBuilder: () => TaskDetailViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: (() => {Navigator.pop(context)}),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text("To go back")),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: const [
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Text("New Task",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900)),
                    ],
                  ),
                  Divider(
                    color: Colors.white.withOpacity(.08),
                    thickness: 2,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 300)),
                      const Padding(padding: EdgeInsets.only(left: 20)),
                      Flexible(
                        child: Form(
                          child: Column(
                            children: [
                              // Add Task Name
                              TextFormField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  labelText: "Task Name",
                                  labelStyle: TextStyle(
                                      color: ColorConstants.altoTypographyColor
                                          .withOpacity(.5)),
                                  fillColor:
                                      ColorConstants.sharkBackgroundColor,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(),
                                  ),
                                ),
                                onChanged: (value) {
                                  // model.taskName = value;
                                },
                              ),
                              const Padding(padding: EdgeInsets.all(15)),
                              // Choose Due Date
                              TextFormField(
                                controller: dateController,
                                decoration: InputDecoration(
                                  labelText: "Task Due Date",
                                  suffixIcon:  Icon(Icons.calendar_today, color: ColorConstants.dodgerblueAppColor,),
                                  
                                  labelStyle: TextStyle(
                                      color: ColorConstants.altoTypographyColor
                                          .withOpacity(.5)),
                                  fillColor:
                                      ColorConstants.sharkBackgroundColor,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(),
                                  ),
                                ),
                                onTap: () async {
                                  DateTime? date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  if (date != null) {
                                    dateController.text = DateFormat('yyyy-MM-dd').format(date);
                                  } else {
                                    dateController.text = "";
                                  }
                                },
                              ),
                              const Padding(padding: EdgeInsets.all(20)), 

                              ElevatedButton(onPressed: ()async => {
                                await model.addTask(),
                                Navigator.pop(context)
                              }, child: const Text("Add Task"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.dodgerblueAppColor), minimumSize: MaterialStateProperty.all(const Size(150, 40))),),
                            ],
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 20)),
                    ],
                  ),
                ],
              ),
            ));
  }
}
