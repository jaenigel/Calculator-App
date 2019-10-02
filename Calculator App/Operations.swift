class Person
{
    //private instance var
    var m_name: String
    var m_age: Float
    
    //Properties
    
    var Name: String {
        get{
            return m_name
        }
        set{
            m_name = newValue
        }
    }
    
    var Age: Float {
        get {
            return m_age
        }
        set {
            m_age = newValue
        }
    }
    
    // initializier or constructor
    init(name:String,age:Float) {
        self.m_name = name
        self.m_age = age
    }
    
    //functions
    func saysHello() -> Void {
        print("\(self.Name) says hello")
    }
    
}
