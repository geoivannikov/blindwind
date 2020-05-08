
const double LOGIN_PAGE_TEXT_FIELD_SIZE = 20.0;

const String EMAIL_LABEL_TEXT = 'Email';
const String PASSWORD_LABEL_TEXT = 'Password';
const String SIGN_IN_TEXT = 'Sign in';
const String SIGN_UP_TEXT = 'Sign up';
const String FORGOT_PASSWORD_TEXT = 'Forgot password';

const String FILL_FIELDS_ERROR = 'All fields must be filled';
const String EMAIL_INCORRECT_FORMAT_ERROR = 'Check email format';
const String PASSWORD_LENGTH_ERROR = 'Password must contain min. 8 symbols max. 50 symbols';
const String PASSWORD_INCORRECT_FORMAT_ERROR = 'Password must contain literal, digits and specified symbols !#\$%&? "';

const String REGULAR_EMAIL_EXPRESSION = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const String REGULAR_PASSWORD_EXPRESSION = r'^.*(?=.{8,50})(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%&? "]).*$';
