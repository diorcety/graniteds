/**
 * Generated by Gas3 v2.2.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (Person.as).
 */

package test.granite.cdi.entity {

    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import mx.collections.ListCollectionView;
    import org.granite.meta;
    import org.granite.tide.IEntityManager;
    import org.granite.tide.IPropertyHolder;
    import org.granite.util.Enum;
    import test.granite.cdi.entity.types.NamedEntity;

    use namespace meta;

    [Managed]
    public class PersonBase extends AbstractEntity implements NamedEntity {

        private var _contacts:ListCollectionView;
        private var _firstName:String;
        private var _fullName:String;
        private var _lastName:String;
        private var _mainContact:Contact;
        private var _salutation:Person$Salutation;

        public function set contacts(value:ListCollectionView):void {
            _contacts = value;
        }
        public function get contacts():ListCollectionView {
            return _contacts;
        }

        public function set firstName(value:String):void {
            _firstName = value;
        }
        public function get firstName():String {
            return _firstName;
        }

        [Bindable(event="unused")]
        public function get fullName():String {
            return _fullName;
        }

        public function set lastName(value:String):void {
            _lastName = value;
        }
        public function get lastName():String {
            return _lastName;
        }

        public function set mainContact(value:Contact):void {
            _mainContact = value;
        }
        public function get mainContact():Contact {
            return _mainContact;
        }

        public function set salutation(value:Person$Salutation):void {
            _salutation = value;
        }
        public function get salutation():Person$Salutation {
            return _salutation;
        }

        meta override function merge(em:IEntityManager, obj:*):void {
            var src:PersonBase = PersonBase(obj);
            super.meta::merge(em, obj);
            if (meta::isInitialized()) {
               em.meta_mergeExternal(src._contacts, _contacts, null, this, 'contacts', function setter(o:*):void{_contacts = o as ListCollectionView}, false);
               em.meta_mergeExternal(src._firstName, _firstName, null, this, 'firstName', function setter(o:*):void{_firstName = o as String}, false);
               em.meta_mergeExternal(src._fullName, _fullName, null, this, 'fullName', function setter(o:*):void{_fullName = o as String}, true);
               em.meta_mergeExternal(src._lastName, _lastName, null, this, 'lastName', function setter(o:*):void{_lastName = o as String}, false);
               em.meta_mergeExternal(src._mainContact, _mainContact, null, this, 'mainContact', function setter(o:*):void{_mainContact = o as Contact}, false);
               em.meta_mergeExternal(src._salutation, _salutation, null, this, 'salutation', function setter(o:*):void{_salutation = o as Person$Salutation}, false);
            }
        }

        public override function readExternal(input:IDataInput):void {
            super.readExternal(input);
            if (meta::isInitialized()) {
                _contacts = input.readObject() as ListCollectionView;
                _firstName = input.readObject() as String;
                _fullName = input.readObject() as String;
                _lastName = input.readObject() as String;
                _mainContact = input.readObject() as Contact;
                _salutation = Enum.readEnum(input) as Person$Salutation;
            }
        }

        public override function writeExternal(output:IDataOutput):void {
            super.writeExternal(output);
            if (meta::isInitialized()) {
                output.writeObject((_contacts is IPropertyHolder) ? IPropertyHolder(_contacts).object : _contacts);
                output.writeObject((_firstName is IPropertyHolder) ? IPropertyHolder(_firstName).object : _firstName);
                output.writeObject((_fullName is IPropertyHolder) ? IPropertyHolder(_fullName).object : _fullName);
                output.writeObject((_lastName is IPropertyHolder) ? IPropertyHolder(_lastName).object : _lastName);
                output.writeObject((_mainContact is IPropertyHolder) ? IPropertyHolder(_mainContact).object : _mainContact);
                output.writeObject((_salutation is IPropertyHolder) ? IPropertyHolder(_salutation).object : _salutation);
            }
        }
    }
}
