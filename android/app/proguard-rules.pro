# Keep all classes that extend Activity, Fragment, or Application
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Fragment
-keep public class * extends androidx.fragment.app.Fragment
-keep public class * extends android.app.Application

# Keep all Parcelable implementations
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep all classes with annotations (e.g., for Retrofit, Room)
-keepattributes *Annotation*

# Retain classes for reflection
-keepclassmembers class * {
    *;
}
