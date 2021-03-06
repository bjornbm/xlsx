{-# LANGUAGE CPP #-}
module Codec.Xlsx.Types.Internal where

import           Control.Arrow
import           Data.Text                  (Text)

#if !MIN_VERSION_base(4,8,0)
import           Control.Applicative
#endif

import           Codec.Xlsx.Parser.Internal
import           Codec.Xlsx.Writer.Internal

newtype RefId = RefId { unRefId :: Text } deriving (Show, Eq, Ord)

instance ToAttrVal RefId where
    toAttrVal = toAttrVal . unRefId

instance FromAttrVal RefId where
    fromAttrVal t = first RefId <$> fromAttrVal t
