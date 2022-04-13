import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tasks/ui/constants/color_constants.dart';
import 'package:tasks/ui/widgets/task.dart';
import '../../core/viewmodels/views/init_viewmodel.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewModel>.reactive(
      viewModelBuilder: () => InitViewModel(),
      builder: (context, model, child) => Scaffold(
        // make list view
        floatingActionButton: FloatingActionButton(
          onPressed: model.move,
          backgroundColor: ColorConstants.blueribbonAppColor,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 20)),
                Text(model.title,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Divider(
                color: Colors.white.withOpacity(.08),
                thickness: 2,
                endIndent: 20,
                indent: 20,
              ),
            ),
            Expanded(
              child: model.busy == true
                  ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        children: const [
                          Text("Loading",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              )),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: model.tasks.isEmpty
                          ? SvgPicture.asset('assets/empty_state.svg',
                              semanticsLabel: 'Acme Logo')
                          : ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              itemCount: model.tasks.length,
                              itemBuilder: (context, index) {
                                return Task(
                                  title: model.tasks[index].title,
                                  id: model.tasks[index].id,
                                  deleteTask: model.deleteTask,
                                  checkTask: model.checkTask,
                                  taskStatus: model.tasks[index].isCompleted,
                                );
                              },
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
