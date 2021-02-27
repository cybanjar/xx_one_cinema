import 'dart:io';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:xx_one_cinema/bloc/blocs.dart';
import 'package:xx_one_cinema/bloc/page_bloc.dart';
import 'package:xx_one_cinema/models/models.dart';
import 'package:xx_one_cinema/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xx_one_cinema/shared/shared.dart';
import 'package:xx_one_cinema/ui/widgets/widgets.dart';
import 'package:random_string/random_string.dart';
import 'package:xx_one_cinema/extensions/extensions.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path/path.dart';

part 'main_page.dart';
part 'wrapper.dart';
part 'sign_in_page.dart';
part 'splash_page.dart';
part 'movie_page.dart';
part 'sign_up_page.dart';
part 'preference_page.dart';
part 'account_confirmation.dart';
part 'movie_detail_page.dart';
part 'select_schedule_page.dart';
part 'select_seat_page.dart';
part 'checkout_page.dart';
part 'success_page.dart';
part 'ticket_page.dart';
part 'ticket_detail_page.dart';
part 'profile_page.dart';
part 'topup_page.dart';
part 'wallet_page.dart';
part 'edit_profile_page.dart';
