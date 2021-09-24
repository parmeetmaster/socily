import 'package:logger/logger.dart';
import 'package:socilybrand/constants/globals.dart';

extension mstrings on String {
  get printerror => {if (Globals.mode == Appmodes.test) Logger().e(this)};

  get printwarn => {if (Globals.mode == Appmodes.test) Logger().w(this)};

  get printinfo => {
        Logger().i(this),
      };

  get printwtf => {if (Globals.mode == Appmodes.test) Logger().wtf(this)};

  get printverbose => {if (Globals.mode == Appmodes.test) Logger().v(this)};
}
