import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/custom_widgets/question_summary/summary_item.dart';
import 'package:flutter_quiz_app/custom_widgets/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.only(top: 18),
                child: SummaryItem(data),
              );
            },
          ).toList(growable: false),
        ),
      ),
    );
  }
}



// @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: SingleChildScrollView(
//         child: Column(
//           children: summaryData.map(
//             (data) {
//               return Padding(
//                 padding: const EdgeInsets.only(top: 18),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor:
//                           ((data['user_answer'] == data['correct_answer'])
//                               ? Colors.green
//                               : Colors.pink),
//                       child: StyledText(
//                         text: ((data['question_index'] as int) + 1).toString(),
//                         size: 14,
//                         alignment: TextAlign.left,
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.only(left: 30),
//                         alignment: Alignment.centerLeft,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               data['question_text'] as String,
//                               style: GoogleFonts.roboto(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                             const SizedBox(
//                               height: 2,
//                             ),
//                             Text(
//                               data['user_answer'] as String,
//                               style: GoogleFonts.roboto(
//                                 color: Color.fromARGB(255, 244, 162, 170),
//                                 fontSize: 18,
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                             const SizedBox(
//                               height: 2,
//                             ),
//                             Text(
//                               data['correct_answer'] as String,
//                               style: GoogleFonts.roboto(
//                                 color: Color.fromARGB(255, 182, 244, 197),
//                                 fontSize: 18,
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ).toList(growable: false),
//         ),
//       ),
//     );
//   }
// }