/**
 * Generated by Gas3 v2.2.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR.
 */

package test.granite.spring.entity {

    import org.granite.util.Enum;

    [Bindable]
    [RemoteClass(alias="test.granite.spring.entity.Person$Salutation")]
    public class Person$Salutation extends Enum {

        public static const Mr:Person$Salutation = new Person$Salutation("Mr", _);
        public static const Ms:Person$Salutation = new Person$Salutation("Ms", _);
        public static const Dr:Person$Salutation = new Person$Salutation("Dr", _);

        function Person$Salutation(value:String = null, restrictor:* = null) {
            super((value || Mr.name), restrictor);
        }

        protected override function getConstants():Array {
            return constants;
        }

        public static function get constants():Array {
            return [Mr, Ms, Dr];
        }

        public static function valueOf(name:String):Person$Salutation {
            return Person$Salutation(Mr.constantOf(name));
        }
    }
}