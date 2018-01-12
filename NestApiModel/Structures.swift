//
//  Structures.swift
//  NestApiModel
//
//  Created by Philipp Maluta on 11.01.18.
//  Copyright © 2018 com.ensoreus. All rights reserved.
//


import Foundation


public protocol KeyedProtocol{
    var id: String? {get set}
}

public extension KeyedProtocol{
    var id : String? {
        return ""
    }
}

public struct Keyed : KeyedProtocol{
    init(){ }
    public var id: String?
}

public protocol DeserializableProtocol{
    func parse(_:String!) -> KeyedProtocol
}

public extension DeserializableProtocol{
    func parse(_:String!) -> KeyedProtocol{
        return Keyed()
    }
}

public struct Deserializable: DeserializableProtocol{}

public protocol PositionProtocol{
    var name: String?{get set}
    var whereIs: String?{get set}
}

public extension PositionProtocol{
    var name: String?{
        return ""
    }
    var whereIs: String?{
        return ""
    }
}

extension NestApi{
    public struct Position: PositionProtocol, DeserializableProtocol{
        public var whereIs: String?
        public var name: String?
    }
    
    public struct IndoorCam: PositionProtocol, DeserializableProtocol{
        public var whereIs: String?
        public var name: String?
    }
    
    public struct OutdoorCam: PositionProtocol, DeserializableProtocol{
        public var whereIs: String?
        public var name: String?
    }
    
    public struct Thermostat: PositionProtocol, DeserializableProtocol{
        public var whereIs: String?
        public var name: String?
    }
    
    public struct Metadata: DeserializableProtocol{
        
    }
    
    public struct HomeEquipment {
        private var metadata: Metadata?
        public var outerCams:[OutdoorCam]
        public var innerCams:[IndoorCam]
        public var thermostats:[Thermostat]
        
    }
}
